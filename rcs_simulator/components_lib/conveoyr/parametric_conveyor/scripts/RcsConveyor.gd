tool
extends RcsConveyor

export(int) var height_conveyor_MM = 711 setget set_height_conveyor
export(int) var width_conveyor_MM = 410 setget set_width_conveyor
export(int) var length_conveyor_MM = 1053  setget set_length_conveyor
export(int) var number_of_leg = 2 setget set_number_of_leg
export (bool) var toggle_rebuild = true setget set_tr
export(bool) var board_right = true setget set_board_right_true, get_board_right_false
export(bool) var board_left = true setget set_board_left_true, get_board_left_false
export(float) var height_board_right_MM = 100 setget set_height_board_right
export(float) var height_board_left_MM = 100 setget set_height_board_left
export(bool) var engine_right = true setget set_engine_right_true, get_engine_right_false
export(bool) var engine_left = true setget set_engine_left_true, get_engine_left_false
export(bool) var knife_transition = false setget set_knife_transition_true, get_knife_transition_false
export(float) var Collision_conveyor = 20 setget set_Collision_conveyor


var last_toggle : bool
var changed: bool
var last_change_timestamp:int
var loaded = false
func get_spatial():
	return get_node_or_null("Spatial")
	#return $Spatial

export var toggle_refresh : bool
var conveyor:RcsConveyor
var part:StaticBody
var prev_toggle_refresh : bool

var spatial : Spatial

func conveyor1():
#height_board
	$Board/Board_left/board_left.scale.y =height_board_left_MM /100
	$Board/Board_right/board_right.scale.y =height_board_right_MM /100

#Collision_conveyor
	$Collision_conveyor.scale.y = Collision_conveyor
	$Collision_conveyor.translation.y = height_conveyor_MM + 28 + $Collision_conveyor.scale.y 

func get_conveyor ():
	return $conveyor

func get_engine ():
	return $Engine

func get_right_engine ():
	return $Engine/engine_right

func get_left_engine ():
	return $Engine/engine_left

func get_board ():
	return $Board

func get_right_board ():
	return $Board/Board_right

func get_left_board ():
	return $Board/Board_left
	
func get_static_bode ():
	return $conveyor_static_bode
	
func get_collision_conveyor():
	return $Collision_conveyor

func get_legs():
	return $Spatial

#height_conveyor 
func set_height_conveyor (height):
	height_conveyor_MM = height
	var height_conveyor = get_conveyor()
	height_conveyor.translation.y =height
	var height_engine = get_engine()
	height_engine.translation.y = height
	var height_board = get_board()
	height_board.translation.y = height
	var height_static_bode = get_static_bode()
	height_static_bode.translation.y = height +12.0
	var height_collision_conveyor = get_collision_conveyor()
	height_collision_conveyor.translation.y = height+45.0
	var height_spatial = get_legs()
	height_spatial.scale.y = height /711.0
	var node = get_spatial()
	if node:
		node.height_conveyor_MM = height

#width_conveyor 
func set_width_conveyor (width):
	var width_conveyor = get_conveyor()
	width_conveyor.scale.z = width  /410.0
	var width_right_engine = get_right_engine()
	width_right_engine.translation.z = - width /1.9 -8.0
	var width_left_engine = get_left_engine()
	width_left_engine.translation.z =  width /1.9 +28
	var width_board_right = get_right_board()
	width_board_right.translation.z =  -width /2.1
	var width_board_left = get_left_board() 
	width_board_left.translation.z =  width /2.0
	var width_static_bode = get_static_bode()
	width_static_bode.translation.y = width +12.0
	var width_collision_conveyor = get_collision_conveyor()
	width_collision_conveyor.scale.z = width
	#var width_spatial = get_legs()
	#width_spatial.scale.z = width /410.0
	var node = get_spatial()
	if node:
		node.width_conveyor_MM = width
	width_conveyor_MM = width

#length_conveyor 
func set_length_conveyor (length):
	var length_conveyor = get_conveyor()
	length_conveyor.scale.x =length /1053.0
	length_conveyor.translation.x =length/2.0
	var length_board_right = get_right_board()
	length_board_right.scale.x =length /1053.0
	#length_board_right.translation.x = length/1053- 588
	var length_board_left = get_left_board() 
	length_board_left.scale.x =length /1053.0
	#length_board_left.translation.x = length /1053.0 -588
	var length_collision_conveyor = get_collision_conveyor()
	length_collision_conveyor.scale.x=length 
	length_collision_conveyor.translation.x=length /2.0
	
	var node = get_spatial()
	if node:
		last_change_timestamp = OS.get_system_time_msecs()
		changed = true
		node.length_conveyor_MM = length
	length_conveyor_MM = length

#number of leg
func set_number_of_leg(number):
	var node = get_spatial()
	if node:
		node.number_of_leg = number
	number_of_leg = number

func set_tr(tog):
	var node = get_spatial()
	if node:
		node.toggle_rebuild = tog
	toggle_rebuild = tog

#height_board
func set_height_board_right (value):
	height_board_right_MM = value
	conveyor1()
func set_height_board_left (value):
	height_board_left_MM = value
	conveyor1()

#engine_right
func get_engine_right() -> MeshInstance:
	return $Engine/engine_right as MeshInstance
func set_engine_right_true(value):
	engine_right = value
	get_engine_right().visible = value
func get_engine_right_false():
	engine_right = get_engine_right().visible
	return engine_right

#engine_left
func get_engine_left() -> MeshInstance:
	return $Engine/engine_left as MeshInstance
func set_engine_left_true(value):
	engine_left = value
	get_engine_left().visible = value
func get_engine_left_false():
	engine_left = get_engine_left().visible
	return engine_left

#board_right
func get_board_right() -> MeshInstance:
	return $Board/Board_right as MeshInstance
func set_board_right_true(value):
	board_right = value
	get_board_right().visible = value
func get_board_right_false():
	board_right = get_board_right().visible
	return board_right

#board_left
func get_board_left() -> MeshInstance:
	return $Board/Board_left as MeshInstance
func set_board_left_true(value):
	board_left = value
	get_board_left().visible = value
func get_board_left_false():
	board_left = get_board_left().visible
	return board_left

#knife_transilition
func get_knife_transition() -> MeshInstance:
	return $conveyor/knife_transition as MeshInstance
func set_knife_transition_true(value):
	knife_transition = value
	get_knife_transition().visible = value
func get_knife_transition_false():
	knife_transition = get_knife_transition().visible
	return knife_transition
	
#Collision_conveyor
func set_Collision_conveyor(value):
	Collision_conveyor = value
	conveyor1()

func _ready():
#	last_toggle = toggle_rebuild
	spatial = get_spatial()
	changed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (changed and (OS.get_system_time_msecs() - last_change_timestamp > 1)):
		property_list_changed_notify()
		changed = false;
