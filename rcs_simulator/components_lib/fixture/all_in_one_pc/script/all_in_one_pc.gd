tool
extends Spatial

export(float) var diagonal_of_monitor_inch = 20 setget set_diagonal_of_monitor

func set_diagonal_of_monitor(value):
	diagonal_of_monitor_inch = value
	var diag_of_monit = get_node_or_null("stationary_part/monitor") as MeshInstance
	if diag_of_monit:
		diag_of_monit.scale.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/0.393701
		diag_of_monit.scale.x = (10*diagonal_of_monitor_inch*16*sqrt(337)/337)/0.393701
		diag_of_monit.scale.z = diagonal_of_monitor_inch/5
		diag_of_monit.translation.z = diagonal_of_monitor_inch/(5)
	var inside_monitor = get_node_or_null("stationary_part/inside_monitor") as MeshInstance
	if inside_monitor:
		inside_monitor.scale.y = (10*diagonal_of_monitor_inch*8.8*sqrt(337)/337)/0.393701
		inside_monitor.scale.x = (10*diagonal_of_monitor_inch*15.8*sqrt(337)/337)/0.393701
		inside_monitor.scale.z = diagonal_of_monitor_inch/5
		inside_monitor.translation.z = diagonal_of_monitor_inch/(5)+0.1
	var back_1 = get_node_or_null("stationary_part/back_1") as MeshInstance
	if back_1:
		back_1.translation.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*4)
		back_1.scale.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*2)
		back_1.scale.x = (10*diagonal_of_monitor_inch*16*sqrt(337)/337)/0.393701
		back_1.scale.z = 4*diagonal_of_monitor_inch/5
		back_1.translation.z = -diagonal_of_monitor_inch/(5)
	var back_2 = get_node_or_null("stationary_part/back_2") as MeshInstance
	if back_2:
		back_2.translation.y = -(10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*20)
		back_2.scale.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*2)
		back_2.scale.x = (10*diagonal_of_monitor_inch*16*sqrt(337)/337)/0.393701
		back_2.scale.z = 4*diagonal_of_monitor_inch/5
		back_2.translation.z = -diagonal_of_monitor_inch/(5)
	var fastener_1 = get_node_or_null("stationary_part/fastener_1") as MeshInstance
	if fastener_1:
		fastener_1.translation.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*2)
		fastener_1.scale.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*8)
		fastener_1.scale.x = (10*diagonal_of_monitor_inch*16*sqrt(337)/337)/(0.393701*2)
		fastener_1.translation.z = diagonal_of_monitor_inch/(5)
		fastener_1.scale.z = diagonal_of_monitor_inch/(5)
	var fastener_2 = get_node_or_null("stationary_part/fastener_2") as MeshInstance
	if fastener_2:
		fastener_2.translation.y = -(10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*2)
		fastener_2.scale.y = (10*diagonal_of_monitor_inch*9*sqrt(337)/337)/(0.393701*8)
		fastener_2.scale.x = (10*diagonal_of_monitor_inch*16*sqrt(337)/337)/(0.393701*2)
		fastener_2.translation.z = diagonal_of_monitor_inch/(5)
		fastener_2.scale.z = diagonal_of_monitor_inch/(5)
