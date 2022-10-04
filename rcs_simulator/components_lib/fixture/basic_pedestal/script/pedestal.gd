tool
extends Spatial

export(float) var height = 120  setget set_height
export(float) var center_size = 70  setget set_center_size
export(float) var platform_size = 100  setget set_platform_size

func set_height(value):
	height = value
	var Cube = get_node_or_null("Cube") as MeshInstance
	if Cube:
		Cube.scale.y = height/100
	var Base_1 = get_node_or_null("Base_1") as MeshInstance
	if Base_1:
		Base_1.translation.y = 7.5+height/2
	var Base_2 = get_node_or_null("Base_2") as MeshInstance
	if Base_2:
		Base_2.translation.y = -7.5-height/2

func set_center_size(value):
	center_size = value
	var Cube = get_node_or_null("Cube") as MeshInstance
	if Cube:
		Cube.scale.z = center_size/100
		Cube.scale.x = center_size/100

func set_platform_size(value):
	platform_size = value
	var Base_1 = get_node_or_null("Base_1") as MeshInstance
	if Base_1:
		Base_1.scale.x = platform_size/100
		Base_1.scale.z = platform_size/100
	var Base_2 = get_node_or_null("Base_2") as MeshInstance
	if Base_2:
		Base_2.scale.x = platform_size/100
		Base_2.scale.z = platform_size/100


