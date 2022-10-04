tool
extends Node


export var grabber_path : NodePath
export var dido_path : NodePath

export var gripped_1_di : int
export var gripped_2_di : int
export var grab_do : int


# Called when the node enters the scene tree for the first time.
func _ready():
	var dido =  get_node(dido_path) as RcsSignalsHolder
	if (dido != null):
		dido.connect("do_changed", self,"OnRobotSignalChanged_Robot")
		print(self.name, " connected to ", dido_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var grabber =  get_node(grabber_path) as Gripper
	var dido =  get_node(dido_path) as RcsSignalsHolder
	if (grabber != null) and (dido != null):
		dido.set_di(gripped_1_di, grabber.get_sensor(Gripper.GRIPPER_1_CLOSED))
		dido.set_di(gripped_2_di, grabber.get_sensor(Gripper.GRIPPER_2_CLOSED))

func OnRobotSignalChanged_Robot(nr, value):
	var grabber =  get_node(grabber_path) as Gripper
	if(nr == grab_do) and (grabber):
		grabber.set_grab_state(value)
