tool
extends Node

export(float) var lifted_of_cable_connection_mm = 0 setget set_lifted
export(float) var lenght_of_legs_mm = 49 setget set_lenght
export(float) var depth_of_sensor_mm = 15 setget set_depth
export(float) var width_of_sensor_mm = 15 setget set_width
export(float) var distance_between_sensor_mm = 20.2 setget set_distance

func set_lifted(value):
	lifted_of_cable_connection_mm = value
	var cable = get_node_or_null("contact_sensors/cable") as MeshInstance
	if cable:
		cable.translation.x = lifted_of_cable_connection_mm


func set_lenght(value):
	lenght_of_legs_mm = value
	var leg1 = get_node_or_null("contact_sensors/leg1") as MeshInstance
	if leg1:
		leg1.translation.z = lenght_of_legs_mm/2
		leg1.scale.z = lenght_of_legs_mm/49
	var leg2 = get_node_or_null("contact_sensors/leg2") as MeshInstance
	if leg2:
		leg2.translation.z = lenght_of_legs_mm/2
		leg2.scale.z = lenght_of_legs_mm/49
	var sensor1 = get_node_or_null("contact_sensors/sensor1") as MeshInstance
	if sensor1:
		sensor1.translation.z = lenght_of_legs_mm-5
	var sensor2 = get_node_or_null("contact_sensors/sensor2") as MeshInstance
	if sensor2:
		sensor2.translation.z = lenght_of_legs_mm-5
	var col_width = get_node_or_null("RcsGrabber/CollisionShape") as CollisionShape
	if col_width:
		col_width.translation.z = sensor2.translation.z

func set_depth(value):
	depth_of_sensor_mm = value
	var leg1 = get_node_or_null("contact_sensors/leg1") as MeshInstance
	if leg1:
		leg1.scale.y = depth_of_sensor_mm/15
	var leg2 = get_node_or_null("contact_sensors/leg2") as MeshInstance
	if leg2:
		leg2.scale.y = depth_of_sensor_mm/15
	var body = get_node_or_null("contact_sensors/body") as MeshInstance
	if body:
		body.scale.y = depth_of_sensor_mm/15
	var hole1 = get_node_or_null("contact_sensors/hole1") as MeshInstance
	if hole1:
		hole1.translation.y = depth_of_sensor_mm/(2)
	var hole4 = get_node_or_null("contact_sensors/hole4") as MeshInstance
	if hole4:
		hole4.translation.y = depth_of_sensor_mm/(2)
	var hole3 = get_node_or_null("contact_sensors/hole3") as MeshInstance
	if hole3:
		hole3.translation.y = -depth_of_sensor_mm/(2)-0.1
	var hole2 = get_node_or_null("contact_sensors/hole2") as MeshInstance
	if hole2:
		hole2.translation.y = -depth_of_sensor_mm/(2)-0.1


func set_width(value):
	width_of_sensor_mm = value
	var leg1 = get_node_or_null("contact_sensors/leg1") as MeshInstance
	if leg1:
		leg1.scale.x = width_of_sensor_mm/15
		leg1.translation.x = width_of_sensor_mm/2+distance_between_sensor_mm/2
	var leg2 = get_node_or_null("contact_sensors/leg2") as MeshInstance
	if leg2:
		leg2.scale.x = width_of_sensor_mm/15
		leg2.translation.x = -width_of_sensor_mm/2-distance_between_sensor_mm/2
	var lamp = get_node_or_null("contact_sensors/lamp") as MeshInstance
	if lamp:
		lamp.translation.x = leg1.translation.x+leg1.scale.x*15/2
	var sensor1 = get_node_or_null("contact_sensors/sensor1") as MeshInstance
	if sensor1:
		sensor1.translation.x = leg2.translation.x+width_of_sensor_mm/2-0.1
	var sensor2 = get_node_or_null("contact_sensors/sensor2") as MeshInstance
	if sensor2:
		sensor2.translation.x = leg1.translation.x-width_of_sensor_mm/2+0.1
	var col_width = get_node_or_null("RcsGrabber/CollisionShape") as CollisionShape
	if col_width:
		col_width.scale.y = 2*(sensor1.translation.x+1.1)

func set_distance(value):
	distance_between_sensor_mm = value
	var sensor1 = get_node_or_null("contact_sensors/sensor1") as MeshInstance
	if sensor1:
		sensor1.translation.x = -distance_between_sensor_mm/2+width_of_sensor_mm/2-7.8
	var sensor2 = get_node_or_null("contact_sensors/sensor2") as MeshInstance
	if sensor2:
		sensor2.translation.x = distance_between_sensor_mm/2-width_of_sensor_mm/2+7.8
	var leg1 = get_node_or_null("contact_sensors/leg1") as MeshInstance
	if leg1:
		leg1.translation.x = distance_between_sensor_mm/2+width_of_sensor_mm/(15*2)+7
	var leg2 = get_node_or_null("contact_sensors/leg2") as MeshInstance
	if leg2:
		leg2.translation.x = -distance_between_sensor_mm/2-width_of_sensor_mm/(15*2)-7
	var body = get_node_or_null("contact_sensors/body") as MeshInstance
	if body:
		body.scale.x = distance_between_sensor_mm/20
	var lamp = get_node_or_null("contact_sensors/lamp") as MeshInstance
	if lamp:
		lamp.translation.x = leg1.translation.x+leg1.scale.x*15/2
	var col_width = get_node_or_null("RcsGrabber/CollisionShape") as CollisionShape
	if col_width:
		col_width.scale.y = 2*(sensor1.translation.x+1.1)
