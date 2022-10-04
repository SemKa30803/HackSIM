tool
extends Spatial

export(int) var height_conveyr_MM = 711 setget set_height_conveyor
export(int) var width_conveyor_MM = 410 setget set_width_conveyor

func _ready():
	pass
#------>Legs<--------------
func get_upper_widht_legs():
	return $leg_2_1

func get_translation_leg_2_1():
	return $leg_2_1

func get_scale_leg1():
	return $leg_1

func get_scale_leg2():
	return $leg_2

func set_height_conveyor(height):
	#---------------->hinges<----------------
	var height_leg_2_1 = get_translation_leg_2_1()
	height_leg_2_1.translation.y = (height /4) +28
	height_leg_2_1.scale.z = height / 711.0
	var height_leg_1 = get_scale_leg1()
	height_leg_1.scale.y = height / 711.0
	height_leg_1.translation.y = height / 2 +28
	var height_leg_2 = get_scale_leg2()
	height_leg_2.scale.y = height / 711.0
	height_leg_2.translation.y = height / 2+28
	height_conveyr_MM=height

func set_width_conveyor(width):
	#---------------->wight<----------------
	var width_leg_2_1 = get_translation_leg_2_1()
	width_leg_2_1.scale.x = width / 410.0
	var width_leg_1 = get_scale_leg1()
	width_leg_1.translation.z = - width/2.0  -30
	var width_leg_2 = get_scale_leg2()
	width_leg_2.translation.z =  width /2.0 +30
	width_conveyor_MM=width
