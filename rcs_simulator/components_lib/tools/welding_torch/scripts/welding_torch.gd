tool
extends Spatial

export(float) var lenght = 0  setget set_lenght
export(float) var bending_angle setget set_bending_angle
export(float) var degrees setget set_degrees

func updater():
	$angles/lenght_and_angle/lenght/part_8.scale.y = lenght /10
	$angles/lenght_and_angle/angle.translation.x = lenght
	$angles/lenght_and_angle/lenght/part_8.translation.y = lenght / 2 - 5
	$angles/lenght_and_angle/angle/degrees.base_rotation.z = bending_angle
	$angles.base_rotation.z = -degrees

func set_lenght(value):
	lenght = value
	updater()

func set_degrees(value):
	degrees = value
	updater()
	
func set_bending_angle(value):
	bending_angle = value
	updater()
