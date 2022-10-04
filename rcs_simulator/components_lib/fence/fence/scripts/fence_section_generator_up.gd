tool
extends Spatial

export(int) var section_height = 2060 setget set_sh
export(int) var section_width = 1500 setget set_sw#,get_sw 
export(int) var floor_gap = 85 setget set_fg

export(int) var fence_length = 7500 setget set_fl#, get_fl

export(int) var number_of_sections = 5 setget set_nos

export (bool) var toggle_rebuild = true setget set_tr
#export var shift_to_first : Vector3
##export var row_step : Vector3
##export var part_rotation_deg : Vector3
#export(String, FILE, "*.tscn") var scene_to_instance : String
#export var parts_group : String
#
#var generator = get_generator()
#var scene_instance
var last_toggle : bool
var changed: bool
var last_change_timestamp:int
var loaded = false
func get_spatial():
	return get_node_or_null("Spatial")
	#return $Spatial

var spatial : Spatial

func set_sh(height):
	var node = get_spatial()
	if node:
		node.section_height = height
	section_height = height

func set_sw(width):
	var node = get_spatial()
	if node:
		last_change_timestamp = OS.get_system_time_msecs()
		changed = true
		node.section_width = width
		set_fl(width*number_of_sections)
	section_width = width

func set_fg(gap):
	var node = get_spatial()
	if node:
		node.floor_gap = gap
	floor_gap = gap

func set_fl(length):
	var node = get_spatial()
	if node:
		last_change_timestamp = OS.get_system_time_msecs()
		changed = true
		node.fence_length = length
		section_width = length/number_of_sections
	fence_length = length

func set_nos(nos):
	var node = get_spatial()
	if node:
		node.number_of_sections = nos
	number_of_sections = nos

func set_tr(tog):
	var node = get_spatial()
	if node:
		node.toggle_rebuild = tog
		set_sw(fence_length/number_of_sections)
	toggle_rebuild = tog

# Called when the node enters the scene tree for the first time.
func _ready():
#	last_toggle = toggle_rebuild
	spatial = get_spatial()
	changed = false
	#loaded  = true
	#set_sh(section_height)
	#property_list_changed_notify()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (changed and (OS.get_system_time_msecs() - last_change_timestamp > 500)):
		property_list_changed_notify()
		changed = false;
