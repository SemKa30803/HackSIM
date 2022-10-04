tool
extends Spatial

export(float) var height_leg_mm = 1000  setget set_height
func set_height(value):
	height_leg_mm = value
	var leg1 = get_node_or_null("table/leg1") as MeshInstance
	if leg1:
		leg1.scale.y = height_leg_mm/1000
	var leg2 = get_node_or_null("table/leg2") as MeshInstance
	if leg2:
		leg2.scale.y = height_leg_mm/1000
	var leg3 = get_node_or_null("table/leg3") as MeshInstance
	if leg3:
		leg3.scale.y = height_leg_mm/1000
	var leg4 = get_node_or_null("table/leg4") as MeshInstance
	if leg4:
		leg4.scale.y = height_leg_mm/1000
	var board = get_node_or_null("table/board") as MeshInstance
	if board:
		board.translation.y = 15+(-1000+height_leg_mm)/2

export(float) var width_mm = 2000  setget set_width
func set_width(value):
	width_mm = value
	var leg1 = get_node_or_null("table/leg1") as MeshInstance
	if leg1:
		leg1.translation.z = -50+width_mm/2 
		leg1.translation.x = -50+width_mm/2
	var leg2 = get_node_or_null("table/leg2") as MeshInstance
	if leg2:
		leg2.translation.z = 50-width_mm/2
		leg2.translation.x = -50+width_mm/2
	var leg3 = get_node_or_null("table/leg3") as MeshInstance
	if leg3:
		leg3.translation.z = -50+width_mm/2
		leg3.translation.x = 50-width_mm/2
	var leg4 = get_node_or_null("table/leg4") as MeshInstance
	if leg4:
		leg4.translation.z = 50-width_mm/2
		leg4.translation.x = 50-width_mm/2
	var board = get_node_or_null("table/board") as MeshInstance
	if board:
		board.scale.z = width_mm/1000
		board.scale.x = width_mm/1000




export (Material) var board_material  setget set_board_material
func set_board_material(value):
	board_material = value
	var board_m = get_node("table/board") as MeshInstance
	board_m.material_override = board_material

export(Material) var leg_material setget set_leg_material
func set_leg_material(value):
	leg_material = value
	var leg1_m = get_node("table/leg1") as MeshInstance
	leg1_m.material_override = leg_material
	var leg2_m = get_node("table/leg2") as MeshInstance
	leg2_m.material_override = leg_material
	var leg3_m = get_node("table/leg3") as MeshInstance
	leg3_m.material_override = leg_material
	var leg4_m = get_node("table/leg4") as MeshInstance
	leg4_m.material_override = leg_material


 
