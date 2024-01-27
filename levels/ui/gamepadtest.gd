extends Control

var joyname
var lxaxis
var lyaxis
var rxaxis
var ryaxis
var dpadup
var dpaddown
var dpadleft
var dpadright

# Called when the node enters the scene tree for the first time.
func _ready():
	joyname = $Info
	lxaxis = $"BoxContainer/VBoxContainer/Left X Axis"
	lyaxis = $"BoxContainer/VBoxContainer/Left Y Axis"
	rxaxis = $"BoxContainer/VBoxContainer2/Right X Axis"
	ryaxis = $"BoxContainer/VBoxContainer2/Right Y Axis"
	dpadup = $"BoxContainer/VBoxContainer/DPAD Up"
	dpaddown = $"BoxContainer/VBoxContainer2/DPAD Down"
	
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE) || (Input.is_joy_button_pressed(0,JOY_BUTTON_A) && (Input.is_joy_button_pressed(0,JOY_BUTTON_B))):
		get_tree().change_scene_to_file("res://levels/ui/debug.tscn")
	joyname.set_text("Current Device: "+str(Input.get_joy_name(0)))
	lxaxis.set_text("Left X Axis "+str(Input.get_joy_axis(0,JOY_AXIS_LEFT_X)))
	lyaxis.set_text("Left Y Axis "+str(Input.get_joy_axis(0,JOY_AXIS_LEFT_Y)))
	rxaxis.set_text("Right X Axis "+str(Input.get_joy_axis(0,JOY_AXIS_RIGHT_X)))
	ryaxis.set_text("Right Y Axis "+str(Input.get_joy_axis(0,JOY_AXIS_RIGHT_Y)))
