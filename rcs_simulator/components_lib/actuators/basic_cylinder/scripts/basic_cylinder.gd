tool
extends Spatial


# Declare member variables here. Examples:
# var a = 2
export (bool) var toggle_positive = 100.0 setget set_toggle_positive, get_toggle_positive
export (float) var body_length = 100.0 setget set_body_length, get_body_length
export (float) var shaft_length = 100.0 setget set_shaft_length, get_shaft_length
export (float) var shaft_diameter = 6.0 setget set_shaft_diameter, get_shaft_diameter
export (float) var shaft_move = 100.0 setget set_shaft_move, get_shaft_move
export (float) var body_diameter = 32.0 setget set_body_diameter, get_body_diameter
export (float) var support_diameter = 6.0 setget set_support_diameter, get_support_diameter
export (float) var cap_thickness = 6.0 setget set_cap_thickness, get_cap_thickness
export (float) var throttle = 1000.0 setget set_throttle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_rcs_sensor_state(value):
	var joint = get_node_or_null("joint") as RcsToggleJoint
	if joint:
		return joint.get_rcs_sensor_state(value)
	else:
		return false

func set_rcs_control_signal(value):
	var joint = get_node_or_null("joint") as RcsToggleJoint
	if joint:
		return joint.set_rcs_control_signal(value)

func set_body_length(length):
	body_length = length
	update_main_body()
	update_support_shafts()
	update_caps()
	update_shaft()

func set_body_diameter(diameter):
	body_diameter = diameter
	update_main_body()
	update_support_shafts()
	update_caps()

func get_body_length():
	return body_length

func get_body_diameter():
	return body_diameter

func set_support_diameter(diameter):
	support_diameter = diameter
	update_support_shafts()
	update_caps()

func get_support_diameter():
	return support_diameter

func set_cap_thickness(value):
	cap_thickness = value
	update_caps()
			
func get_cap_thickness():
	return cap_thickness

func set_shaft_length(value):
	shaft_length = value
	update_shaft()
			
func get_shaft_length():
	return shaft_length

func set_shaft_diameter(value):
	shaft_diameter = value
	update_caps()
	update_shaft()
			
func get_shaft_diameter():
	return shaft_diameter

func set_shaft_move(value):
	shaft_move = value
	update_shaft()
			
func get_shaft_move():
	return shaft_move

func set_toggle_positive(value):
	toggle_positive = value
	update_shaft()
	var joint = get_node_or_null("joint") as RcsToggleJoint
	if joint:
		joint.TogglePositive = toggle_positive

func get_toggle_positive():
	var joint = get_node_or_null("joint") as RcsToggleJoint
	if joint:
		toggle_positive = joint.TogglePositive
	return toggle_positive

func set_throttle(value):
	throttle = value
	update_shaft()

func update_shaft():
	var joint = get_node_or_null("joint") as RcsToggleJoint
	var shaft = get_node_or_null("joint/shaft") as Spatial
	var shaft_mesh = get_node_cylinder_mesh("joint/shaft")
	if joint:
		joint.MinBorder = 0
		joint.MaxBorder = shaft_move
		joint.Throttle = throttle
	if shaft:
		shaft.translation.y =  (max(body_length, shaft_length) - shaft_move) / 2
	if shaft_mesh:
		shaft_mesh.height = shaft_length
		shaft_mesh.top_radius = shaft_diameter / 2.0
		shaft_mesh.bottom_radius = shaft_diameter / 2.0

func get_support_shaft_pos_shift():
	var body_r = body_diameter / 2.0 + support_diameter / 2.0
	return sqrt(body_r * body_r / 2.0) + support_diameter / 4.0

func update_support_shafts():
	var r = get_support_shaft_pos_shift()
	var shaft_poses = []
	shaft_poses.append(Vector3(r, 0.0, r))
	shaft_poses.append(Vector3(-r, 0.0, r))
	shaft_poses.append(Vector3(-r, 0.0, -r))
	shaft_poses.append(Vector3(r, 0.0, -r))
	for i in [1,2,3,4]:
		var shaft_mesh = get_support_shaft_mesh(i)
		if shaft_mesh:
			shaft_mesh.height = body_length + 2
			shaft_mesh.bottom_radius = support_diameter / 2.0
			shaft_mesh.top_radius = support_diameter / 2.0
		var shaft = get_support_shaft(i)
		if shaft:
			shaft.translation = shaft_poses[i-1]

func update_main_body():
	var main_body = get_main_body()
	if main_body:
		main_body.top_radius = body_diameter / 2.0
		main_body.bottom_radius = main_body.top_radius
		main_body.height = body_length-1

func update_caps():
	var r = get_support_shaft_pos_shift()
	var cap_size = max(r * 2.0 + support_diameter + 4, body_diameter + 4)
	var cap_y = body_length / 2.0 - cap_thickness / 2.0
	var shaft_way = get_node_or_null("shaft_way") as Spatial
	if shaft_way:
		shaft_way.translation.y = cap_y
	var shaft_way_mesh = get_node_cylinder_mesh("shaft_way")
	if shaft_way_mesh:
		shaft_way_mesh.bottom_radius = shaft_diameter
		shaft_way_mesh.top_radius = shaft_diameter
		shaft_way_mesh.height = cap_thickness + 2
	for cap in ["top_cap", "bottom_cap"]:
		var mesh = get_node_cube_mesh(cap)
		if mesh:
			mesh.size = Vector3(cap_size , cap_thickness , cap_size)
		var instance = get_node_or_null(cap) as Spatial
		if instance:
			instance.translation.y = cap_y
		cap_y = - cap_y

			
func get_node_cylinder_mesh(path:String)-> CylinderMesh:
	var instance = get_node_or_null(path) as MeshInstance
	if instance:
		return instance.mesh as CylinderMesh
	else:
		return null

func get_node_cube_mesh(path:String)-> CubeMesh:
	var instance = get_node_or_null(path) as MeshInstance
	if instance:
		return instance.mesh as CubeMesh
	else:
		return null

func get_main_body()-> CylinderMesh:
	var main_body = get_node_or_null("main_body") as MeshInstance
	if main_body:
		return main_body.mesh as CylinderMesh
	else:
		return null

func get_support_shaft_mesh(nr:int)-> CylinderMesh:
	var node = get_support_shaft(nr) as MeshInstance
	if node:
		return node.mesh as CylinderMesh
	else:
		return null

func get_support_shaft(nr:int)-> Spatial:
	return get_node_or_null("support_shaft_" + str(nr)) as Spatial
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
