
tool
extends Spatial
export(float) var scale_of_chair = 1  setget set_scale_of_chair
export(float) var height_of_chair_mm = 400  setget set_height_of_leg

func set_scale_of_chair(value):
	scale_of_chair = value
	var legs = get_node_or_null("legs") as Spatial
	if legs:
		legs.translation.y = scale_of_chair*400/2
	var leg_one = get_node_or_null("legs/leg1") as MeshInstance
	if leg_one:
		leg_one.scale.y = scale_of_chair*400
		leg_one.scale.z = scale_of_chair
		leg_one.scale.x = scale_of_chair
		leg_one.translation.z = scale_of_chair*400
	var leg_two = get_node_or_null("legs/leg2") as MeshInstance
	if leg_two:
		leg_two.scale.y = scale_of_chair*400
		leg_two.scale.z = scale_of_chair
		leg_two.scale.x = scale_of_chair
	var leg_three = get_node_or_null("legs/leg3") as MeshInstance
	if leg_three:
		leg_three.scale.y = scale_of_chair*400
		leg_three.scale.z = scale_of_chair
		leg_three.scale.x = scale_of_chair
		leg_three.translation.x = scale_of_chair*400
	var leg_four = get_node_or_null("legs/leg4") as MeshInstance
	if leg_four:
		leg_four.scale.y = scale_of_chair*400
		leg_four.scale.z = scale_of_chair
		leg_four.scale.x = scale_of_chair
		leg_four.translation.x = scale_of_chair*400
		leg_four.translation.z = scale_of_chair*400
	var syst = get_node_or_null("sys") as Spatial
	if syst:
		syst.translation.y = scale_of_chair*400
		syst.translation.x = scale_of_chair*400/2
		syst.translation.z = scale_of_chair*400/2
	var plate = get_node_or_null("sys/plate") as MeshInstance
	if plate:
		plate.scale.y = scale_of_chair
		plate.scale.x = scale_of_chair
		plate.scale.z = scale_of_chair
		plate.translation.x = scale_of_chair
	var back_of_chair_pr1 = get_node_or_null("sys/back_of_chair_pr1") as MeshInstance
	if back_of_chair_pr1:
		back_of_chair_pr1.scale.y = scale_of_chair
		back_of_chair_pr1.scale.x = scale_of_chair
		back_of_chair_pr1.scale.z = scale_of_chair
		back_of_chair_pr1.translation.y = 0.6*scale_of_chair*400
		back_of_chair_pr1.translation.x = scale_of_chair
		back_of_chair_pr1.translation.z = -scale_of_chair*400/2
	var back_of_chair_pr2 = get_node_or_null("sys/back_of_chair_pr2") as MeshInstance
	if back_of_chair_pr2:
		back_of_chair_pr2.scale.y = scale_of_chair
		back_of_chair_pr2.scale.x = scale_of_chair
		back_of_chair_pr2.scale.z = scale_of_chair
		back_of_chair_pr2.translation.y = 0.1*scale_of_chair*400
		back_of_chair_pr2.translation.x = scale_of_chair*400/2.272
		back_of_chair_pr2.translation.z = -scale_of_chair*400/2
	var back_of_chair_pr3 = get_node_or_null("sys/back_of_chair_pr3") as MeshInstance
	if back_of_chair_pr3:
		back_of_chair_pr3.scale.y = scale_of_chair
		back_of_chair_pr3.scale.x = scale_of_chair
		back_of_chair_pr3.scale.z = scale_of_chair
		back_of_chair_pr3.translation.y = 0.1*scale_of_chair*400
		back_of_chair_pr3.translation.x = -scale_of_chair*400/2.3
		back_of_chair_pr3.translation.z = -scale_of_chair*400/2

func set_height_of_leg(value):
	height_of_chair_mm = value
	var legs = get_node_or_null("legs") as Spatial
	if legs:
		legs.translation.y = height_of_chair_mm/2
	var leg_one = get_node_or_null("legs/leg1") as MeshInstance
	if leg_one:
		leg_one.scale.y = height_of_chair_mm
	var leg_two = get_node_or_null("legs/leg2") as MeshInstance
	if leg_two:
		leg_two.scale.y = height_of_chair_mm
	var leg_three = get_node_or_null("legs/leg3") as MeshInstance
	if leg_three:
		leg_three.scale.y = height_of_chair_mm
	var leg_four = get_node_or_null("legs/leg4") as MeshInstance
	if leg_four:
		leg_four.scale.y = height_of_chair_mm
	var syst = get_node_or_null("sys") as Spatial
	if syst:
		syst.translation.y = height_of_chair_mm
	
