tool
extends Spatial #Fence_section

#class_name Fence

export(int) var section_height = 2060 setget set_sh
export(int) var section_width = 1500 setget set_sw#,get_sw 
export(int) var floor_gap = 85 setget set_fg

export(int) var fence_length = 7500 setget set_fl#, get_fl

export(int) var number_of_sections = 5 setget set_nos

export var toggle_rebuild : bool
export var shift_to_first : Vector3
#export var row_step : Vector3
#export var part_rotation_deg : Vector3
export(String, FILE, "*.tscn") var scene_to_instance : String
export var parts_group : String

#onready var sceneScene = preload("res://scene_simple.tscn")
#var width_of_section : int
var generator = get_generator()
var scene_instance
var last_toggle : bool
var changed: bool
var last_change_timestamp:int

func _addNode(scene : Node, container : Node, child : Node):
	container.add_child(child)
	child.set_owner(scene)

func _generateScene() -> Node:
	var scene = scene_instance.instance()	
	scene.name = parts_group + "_1"
	if (parts_group.length() > 0):
		scene.add_to_group(parts_group, true)
	return scene

func get_generator():
	return $"."



#----------------------------->SETTERS<----------------------------------------------------------
func set_fl(length):
#	fence_length = length
	last_change_timestamp = OS.get_system_time_msecs()
	changed = true
	var scenes = generator.get_children()
	scenes.sort()
#	set_sw(length/number_of_sections)
	for scene in scenes:
		var a = scenes.bsearch(scene) as int
		section_width = length/number_of_sections
		scene.section_width = section_width
		scene.translation.z = 0+section_width*a
#		length = scene.section_width*number_of_sections
		fence_length = length

func set_nos(number):
	number_of_sections=number as int

func set_sh(height):
	section_height = height
	var scenes = generator.get_children()
	for scene in scenes:
		scene.section_height = height

func set_sw(width):
	var scenes = generator.get_children()
	scenes.sort()
	last_change_timestamp = OS.get_system_time_msecs()
	changed = true
	set_fl(width*number_of_sections)
	for scene in scenes:
		var a = scenes.bsearch(scene) as int
		scene.section_width = width
		scene.translation.z = 0+width*a
		section_width = width


func set_fg(gap):
	floor_gap = gap
	var scenes = generator.get_children()
	for scene in scenes:
		scene.floor_gap = gap
#------------------------------><--------------------------------------------------------------

func _generateScenes(containerName : String):
	var root = get_tree().get_edited_scene_root()
	if(root == null):
		printerr("Scene was null.")
		return
	
	var container = root.get_node(containerName)
	if(container == null):
		printerr("Container %s not found." % containerName)
		return
	
	scene_instance = load(scene_to_instance)
	
	for j in range(number_of_sections):
		var scene = _generateScene() 
		scene.section_height = section_height
		scene.section_width = fence_length/number_of_sections
		set_sw(fence_length/number_of_sections)
		var row_step = Vector3(0,0,scene.section_width)
		scene.floor_gap = floor_gap
		scene.transform.origin = shift_to_first + row_step*j
#		scene.rotation_degrees = part_rotation_deg
		_addNode(root, container, scene)

func _clearAllGeneratedScenes():
	if (parts_group.length() > 0):
		var scenes = generator.get_children() #get_tree().get_nodes_in_group(parts_group)
		if (len(scenes) == 0):
			print("Delete generated scenes was break. Not found generated scenes.")
			return
		
		for scene in scenes:
			generator.remove_child(scene)
			#var parent = scene.get_parent()
			#parent.remove_child(scene)

func _checkRebuildScenes():
	if (last_toggle != toggle_rebuild):
		rebuild()
		last_toggle = toggle_rebuild

func rebuild():
	_clearAllGeneratedScenes()
	_generateScenes(self.get_path())

# Called when the node enters the scene tree for the first time.
func _ready():		
#	toggle_rebuild =  false
	last_toggle = toggle_rebuild#not
	changed = false;
	#_checkRebuildScenes()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	_checkRebuildScenes()
	if (changed and (OS.get_system_time_msecs() - last_change_timestamp > 500)):
		property_list_changed_notify()
		changed = false
