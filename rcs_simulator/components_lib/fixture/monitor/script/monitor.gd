tool
extends Spatial

export(float) var diagonal_of_monitor_inch = 20 setget set_diagonal_of_monitor

func set_diagonal_of_monitor(value):
	diagonal_of_monitor_inch = value
	var diag_of_monit = get_node_or_null("up_monitor/monitor") as MeshInstance
	if diag_of_monit:
		diag_of_monit.scale.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/0.393701
		diag_of_monit.scale.x = (10*diagonal_of_monitor_inch*16*sqrt(337)/337)/0.393701
	var inside_of_monitor = get_node_or_null("up_monitor/inside_monitor") as MeshInstance
	if inside_of_monitor:
		inside_of_monitor.scale.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/0.393701
		inside_of_monitor.scale.x = (10*diagonal_of_monitor_inch*16*sqrt(337)/337)/0.393701
	var up_monitors = get_node_or_null("up_monitor") as Spatial
	if up_monitors: 
		up_monitors.translation.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*2)
	var up_leg = get_node_or_null("up_monitor/up_leg") as MeshInstance
	if up_leg:
		up_leg.scale.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/0.393701
		up_leg.scale.x = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*30)
	var fixture_monitor = get_node_or_null("up_monitor/fixture_monitor") as MeshInstance
	if fixture_monitor:
		fixture_monitor.scale.y = 10*diagonal_of_monitor_inch/5
		fixture_monitor.scale.x = 10*diagonal_of_monitor_inch/5
	var inside_monitor = get_node_or_null("up_monitor/inside_monitor") as MeshInstance
	if inside_monitor:
		inside_monitor.scale.y = (10*diagonal_of_monitor_inch*8.8*sqrt(337)/337)/0.393701
		inside_monitor.scale.x = (10*diagonal_of_monitor_inch*15.8*sqrt(337)/337)/0.393701
	var plate = get_node_or_null("stands/plate") as MeshInstance
	if plate:
		plate.scale.z = 10*diagonal_of_monitor_inch/20
		plate.scale.x = 10*diagonal_of_monitor_inch/20
		plate.scale.y = 10*diagonal_of_monitor_inch/20
	var leg = get_node_or_null("stands/leg") as MeshInstance
	if leg:
		leg.translation.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*20)
		leg.scale.x = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*30)
		leg.scale.y = 10*diagonal_of_monitor_inch/80
