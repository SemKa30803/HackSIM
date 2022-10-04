tool
extends Spatial 

export(int) var height_conveyr_MM = 711 setget set_height_conveyor
export(int) var width_conveyor_MM = 410 setget set_width_conveyor
export(int) var length_conveyor_MM = 1053 setget set_length_conveyor
export(int) var number_of_leg = 2 setget set_nubmer_leg

export var toggle_rebuild : bool
export(String, FILE, "*.tscn") var scene_to_instance : String
export var parts_group : String
export var shift_to_first : Vector3

#onready var sceneScene = preload("res://scene_simple.tscn")
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
func set_length_conveyor(length):
	last_change_timestamp = OS.get_system_time_msecs()
	changed = true
	var scenes = generator.get_children()
	scenes.sort()
	for scene in scenes:
		scene.translation.x = length/(number_of_leg)
		length_conveyor_MM = length

func set_height_conveyor(height):
	height_conveyr_MM = height
	var scenes = generator.get_children()
	for scene in scenes:
		scene.height_conveyr_MM = height

func set_width_conveyor(width):
	width_conveyor_MM = width
	var scenes = generator.get_children()
	for scene in scenes:
		scene.width_conveyor_MM = width

func set_nubmer_leg(number):
	number_of_leg=number as int

#------------------------------>generate legs<----------------------------------------------
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
	
	for j in range(number_of_leg):
		var scene = _generateScene() 
		scene.height_conveyr_MM = height_conveyr_MM
		scene.width_conveyor_MM = width_conveyor_MM
		scene.translation.x = (length_conveyor_MM ) /number_of_leg 
		var row_step = Vector3(scene.translation.x,0,0)
		scene.transform.origin = shift_to_first + row_step*j
		_addNode(root, container, scene)

func _clearAllGeneratedScenes():
	if (parts_group.length() > 0):
		var scenes = generator.get_children() 
		if (len(scenes) == 0):
			print("Delete generated scenes was break. Not found generated scenes.")
			return

		for scene in scenes:
			generator.remove_child(scene)

func _checkRebuildScenes():
	if (last_toggle != toggle_rebuild):
		rebuild()
		last_toggle = toggle_rebuild

func rebuild():
	_clearAllGeneratedScenes()
	_generateScenes(self.get_path())

# Called when the node enters the scene tree for the first time.
func _ready():		
	last_toggle = toggle_rebuild
	changed = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	_checkRebuildScenes()
	if (changed and (OS.get_system_time_msecs() - last_change_timestamp > 500)):
		property_list_changed_notify()
		changed = false
