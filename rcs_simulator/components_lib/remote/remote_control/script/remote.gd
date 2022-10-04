tool
extends Spatial

var x=0
var y=0
var z=0
var v=150

export(bool) var Emergency = true setget set_p1, get_p1

func get_part1() -> RcsToggleJoint:
	return $Emergency as RcsToggleJoint

func set_p1(value):
	Emergency = value
	get_part1().visible = value

func get_p1():
	Emergency = get_part1().visible
	return Emergency

export(bool) var Button1 = true setget set_p2, get_p2

func get_part2() -> RcsToggleJoint:
	return $Button1 as RcsToggleJoint

func set_p2(value):
	Button1 = value
	get_part2().visible = value
	if Button2==false:
		if Button1==false:
			$Emergency/base1.translation.z = 110
			$Emergency/emergency.translation.z = 110
			$Emergency/base_emergency.translation.z = 110
		else:
			$Emergency/base1.translation.z = 70
			$Emergency/emergency.translation.z = 70
			$Emergency/base_emergency.translation.z = 70
	else:
		if Button1==false:
			$Emergency/base1.translation.z = 70
			$Emergency/emergency.translation.z = 70
			$Emergency/base_emergency.translation.z = 70
		else:
			$Emergency/base1.translation.z = 30
			$Emergency/emergency.translation.z = 30
			$Emergency/base_emergency.translation.z = 30


func get_p2():
	Button1 = get_part2().visible
	return Button1

export(bool) var Button2 = true setget set_p3, get_p3

func get_part3() -> RcsToggleJoint:
	return $Button2 as RcsToggleJoint

func set_p3(value):
	Button2 = value
	get_part3().visible = value
	if Button2 == false:
		$Button1/base2.translation.z = 110
		$Button1/button1.translation.z = 110
		z=1
	else:
		if z==1:
			$Button1/base2.translation.z = 70
			$Button1/button1.translation.z = 70
		z=0
	if Button2==false:
		if Button1==false:
			$Emergency/base1.translation.z = 110
			$Emergency/emergency.translation.z = 110
			$Emergency/base_emergency.translation.z = 110
		else:
			$Emergency/base1.translation.z = 70
			$Emergency/emergency.translation.z = 70
			$Emergency/base_emergency.translation.z = 70
	else:
		if Button1==false:
			$Emergency/base1.translation.z = 70
			$Emergency/emergency.translation.z = 70
			$Emergency/base_emergency.translation.z = 70
		else:
			$Emergency/base1.translation.z = 30
			$Emergency/emergency.translation.z = 30
			$Emergency/base_emergency.translation.z = 30

func get_p3():
	Button2 = get_part3().visible
	return Button2

export(bool) var Key = true setget set_p4, get_p4

func get_part4() -> RcsToggleJoint:
	return $Key as RcsToggleJoint

func set_p4(value):
	Key = value
	get_part4().visible = value

func get_p4():
	Key = get_part4().visible
	return Key

export(bool) var key_on_off = false setget set_p5, get_p5

func get_part5() -> RcsToggleJoint:
	return $Key/keys as RcsToggleJoint

func set_p5(value):
	key_on_off = value
	get_part5().TogglePositive = value
func get_p5():
	key_on_off = get_part5().TogglePositive
	return key_on_off

export (Material) var base_material  setget set_base_material
func set_base_material(value):
	base_material = value
	var base_m1 = get_node("Emergency/base1") as MeshInstance
	base_m1.material_override = base_material
	var base_m2 = get_node("Button1/base2") as MeshInstance
	base_m2.material_override = base_material
	var base_m3 = get_node("Button2/base3") as MeshInstance
	base_m3.material_override = base_material
	var base_m4 = get_node("Key/base4") as MeshInstance
	base_m4.material_override = base_material

export (Material) var button1_material  setget set_button1_material
func set_button1_material(value):
	button1_material = value
	var button1_m1 = get_node("Button1/button1") as MeshInstance
	button1_m1.material_override = button1_material

export (Material) var button2_material  setget set_button2_material
func set_button2_material(value):
	button2_material = value
	var button2_m1 = get_node("Button2/button2") as MeshInstance
	button2_m1.material_override = button2_material




