tool
extends Spatial

export(float) var fork_length = 1000  setget set_fork

func set_fork(value):
	fork_length = value
	var fork11 = get_node_or_null("F1/height/fork11") as MeshInstance
	if fork11:
		fork11.scale.x = fork_length/55
	var fork21 = get_node_or_null("F1/height/fork22") as MeshInstance
	if fork21:
		fork21.scale.x = fork_length/55
	var fork121 = get_node_or_null("F1/height/fork11") as MeshInstance
	if fork121:
		fork121.translation.x = -1323-fork_length/2.2
	var fork221 = get_node_or_null("F1/height/fork22") as MeshInstance
	if fork221:
		fork221.translation.x = -1323-fork_length/2.2
	if value < 50:
		if value < 12:
			var fork15 = get_node_or_null("F1/height/fork1") as MeshInstance
			if fork15:
				fork15.scale.x = fork_length/1000
			var fork25 = get_node_or_null("F1/height/fork2") as MeshInstance
			if fork25:
				fork25.scale.x = fork_length/1000
			var fork145 = get_node_or_null("F1/height/fork1") as MeshInstance
			if fork145:
				fork145.translation.x = -1304-fork_length/2
			var fork245 = get_node_or_null("F1/height/fork2") as MeshInstance
			if fork245:
				fork245.translation.x = -1304-fork_length/2
		else:
			var fork1 = get_node_or_null("F1/height/fork1") as MeshInstance
			if fork1:
				fork1.scale.x = fork_length/1000
			var fork2 = get_node_or_null("F1/height/fork2") as MeshInstance
			if fork2:
				fork2.scale.x = fork_length/1000
			var fork14 = get_node_or_null("F1/height/fork1") as MeshInstance
			if fork14:
				fork14.translation.x = -1204.103-fork_length/2
			var fork24 = get_node_or_null("F1/height/fork2") as MeshInstance
			if fork24:
				fork24.translation.x = -1204.103-fork_length/2
	else:
		var fork141 = get_node_or_null("F1/height/fork1") as MeshInstance
		if fork141:
			fork141.translation.x = -1304-fork_length/1.1
		var fork241 = get_node_or_null("F1/height/fork2") as MeshInstance
		if fork241:
			fork241.translation.x = -1304-fork_length/1.1

export(float) var fork_width = 100  setget set_fork_width

func set_fork_width(value):
	fork_width = value
	if value < 300:
		var width11 = get_node_or_null("F1/height/fork1") as MeshInstance
		if width11:
			width11.scale.y = fork_width/1500
		var width21 = get_node_or_null("F1/height/fork2") as MeshInstance
		if width21:
			width21.scale.y = fork_width/1500
		var width23 = get_node_or_null("F1/height/fork11") as MeshInstance
		if width23:
			width23.scale.y = fork_width/100
		var width24 = get_node_or_null("F1/height/fork22") as MeshInstance
		if width24:
			width24.scale.y = fork_width/100
		var width13 = get_node_or_null("F1/height/upper_fork_1") as MeshInstance
		if width13:
			width13.scale.y = fork_width/1500
		var width25 = get_node_or_null("F1/height/upper_fork_2") as MeshInstance
		if width25:
			width25.scale.y = fork_width/1500
	else:
		var width11 = get_node_or_null("F1/height/fork1") as MeshInstance
		if width11:
			width11.scale.y = 0.107
		var width21 = get_node_or_null("F1/height/fork2") as MeshInstance
		if width21:
			width21.scale.y = 0.107
		var width13 = get_node_or_null("F1/height/upper_fork_1") as MeshInstance
		if width13:
			width13.scale.y = 0.107
		var width25 = get_node_or_null("F1/height/upper_fork_2") as MeshInstance
		if width25:
			width25.scale.y = 0.107
		var width23 = get_node_or_null("F1/height/fork11") as MeshInstance
		if width23:
			width23.scale.y = 1.6
		var width24 = get_node_or_null("F1/height/fork22") as MeshInstance
		if width24:
			width24.scale.y = 1.6



 
export(float) var height = 0  setget set_height

func set_height(value):
	height = value
	var height1 = get_node_or_null("F1/height/lattice_lower") as MeshInstance
	if height1:
		height1.translation.z = -height-279.249
	var height2 = get_node_or_null("F1/height/vert_1") as MeshInstance
	if height2:
		height2.translation.z = -height
	var height3 = get_node_or_null("F1/height/vert_2") as MeshInstance
	if height3:
		height3.translation.z = -height
	var height4 = get_node_or_null("F1/height/hor_3") as MeshInstance
	if height4:
		height4.translation.z = -height+607.996
	var height5 = get_node_or_null("F1/height/hor_1") as MeshInstance
	if height5:
		height5.translation.z = -height+164.443
	var height6 = get_node_or_null("F1/height/fork1") as MeshInstance
	if height6:
		height6.translation.z = -height+287.994
	var height7 = get_node_or_null("F1/height/fork2") as MeshInstance
	if height7:
		height7.translation.z = -height+287.994
	var height8 = get_node_or_null("F1/height/upper_fork_1") as MeshInstance
	if height8:
		height8.translation.z = -height+290.455
	var height9 = get_node_or_null("F1/height/upper_fork_2") as MeshInstance
	if height9:
		height9.translation.z = -height+290.455
	var height10 = get_node_or_null("F1/height/fork11") as MeshInstance
	if height10:
		height10.translation.z = -height+609.378
	var height11 = get_node_or_null("F1/height/fork22") as MeshInstance
	if height11:
		height11.translation.z = -height+609.378



export(float) var height_balk = 1500  setget set_height_balk

func set_height_balk(value):
	height_balk = value
	var height30 = get_node_or_null("F1/balk1") as MeshInstance
	if height30:
		height30.scale.z = height_balk/10000
		height30.translation.z = 1000-height_balk/2.2275
		
	var height31 = get_node_or_null("F1/balk2") as MeshInstance
	if height31:
		height31.scale.z = height_balk/10000
		height31.translation.z = 1000-height_balk/2.2275
