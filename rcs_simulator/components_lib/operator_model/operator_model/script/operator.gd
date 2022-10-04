tool
extends Spatial

export(bool) var sit = false setget set_sit1, get_sit

func get_hips() -> RcsToggleJoint:
	return $hips as RcsToggleJoint

func set_sit1(value):
	sit = value
	get_hips().TogglePositive = value
	var tops1 = value
	var tops = get_node("tors") as RcsToggleJoint
	if tops:
		tops.TogglePositive = tops1

func get_sit():
	sit = get_hips().TogglePositive
	return sit

export(bool) var arms = false setget set_arms, get_arms

func get_arm() -> RcsToggleJoint:
	return $tors/arms as RcsToggleJoint

func set_arms(value):
	arms = value
	get_arm().TogglePositive = value
	var arms1 = value
	var arms2 = get_node("tors/arms2") as RcsToggleJoint
	if arms2:
		arms2.TogglePositive = arms1

func get_arms():
	arms = get_arm().TogglePositive
	return arms

export(bool) var bend = false setget set_bend, get_bend

func get_bends() -> RcsToggleJoint:
	return $tors/arms/bend as RcsToggleJoint

func set_bend(value):
	bend = value
	get_bends().TogglePositive = value
	var bend1 = value
	var bend2 = get_node("tors/arms2/bend2") as RcsToggleJoint
	if bend2:
		bend2.TogglePositive = bend1

func get_bend():
	bend = get_bends().TogglePositive
	return bend
