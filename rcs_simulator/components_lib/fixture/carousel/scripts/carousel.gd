tool
extends Node
 
export(float) var carousel_table_diameter_mm = 1052 setget set_diameter
export(float) var carousel_height_mm = 760 setget set_height

var base = get_node_or_null("table/carousel_base") as Spatial
var height = get_node_or_null("table") as Spatial
var table = get_node_or_null("table/joint/table_with_drive") as Spatial

func set_diameter(value):
	carousel_table_diameter_mm = value
	table.scale.x = carousel_table_diameter_mm/1052
	table.scale.z = carousel_table_diameter_mm/1052
	base.scale.x = carousel_table_diameter_mm/1052
	base.scale.y = carousel_table_diameter_mm/1052

func set_height(value):
	carousel_height_mm = value 
	height.scale.y = carousel_height_mm/760 
