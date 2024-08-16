extends Control

const gamepadtest = preload("res://gamepad.gd")
var joyname
var lxaxis
var lyaxis
var rxaxis
var ryaxis
var dpadup
var dpaddown
var dpadleft
var dpadright
var lt
var rt
var ls
var rs
var l3
var r3
var view
var menu
var xb
var yb
var ab
var bb

# Called when the node enters the scene tree for the first time.
func _ready():
	joyname = $Info
	lxaxis = $"BoxContainer/VBoxContainer/Left X Axis"
	lyaxis = $"BoxContainer/VBoxContainer/Left Y Axis"
	rxaxis = $"BoxContainer/VBoxContainer2/Right X Axis"
	ryaxis = $"BoxContainer/VBoxContainer2/Right Y Axis"
	dpadup = $"BoxContainer/VBoxContainer/DPAD Up"
	dpaddown = $"BoxContainer/VBoxContainer2/DPAD Down"
	dpadleft = $"BoxContainer/VBoxContainer/DPAD Left"
	dpadright = $"BoxContainer/VBoxContainer2/DPAD Right"
	lt = $"BoxContainer/VBoxContainer/Left Trigger"
	rt = $"BoxContainer/VBoxContainer2/Right Trigger"
	ls = $"BoxContainer/VBoxContainer/Left Shoulder"
	rs = $"BoxContainer/VBoxContainer2/Right Shoulder"
	l3 = $"BoxContainer/VBoxContainer/Left Stick"
	r3 = $"BoxContainer/VBoxContainer2/Right Stick"
	view = $BoxContainer/VBoxContainer/View
	menu = $BoxContainer/VBoxContainer2/Menu
	xb = $BoxContainer/VBoxContainer/X
	yb = $BoxContainer/VBoxContainer2/Y
	ab = $BoxContainer/VBoxContainer/A
	bb = $BoxContainer/VBoxContainer2/B
	
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE) || (Input.is_joy_button_pressed(0,JOY_BUTTON_A) && (Input.is_joy_button_pressed(0,JOY_BUTTON_B))):
		get_tree().change_scene_to_file("res://levels/ui/debug.tscn")
	gamepadtest.new(event)
	if Global.gamepad == 1:
		joyname.set_text("Current Device: "+str(Input.get_joy_name(0))+"\nController Type: Western"+"\nIf drift threshold is 0.2 or higher, your gamepad need new sticks")
	elif Global.gamepad == 2:
		joyname.set_text("Current Device: "+str(Input.get_joy_name(0))+"\nController Type: Japanese"+"\nIf drift threshold is 0.2 or higher, your gamepad need new sticks")
	elif Global.gamepad == 3:
		joyname.set_text("Current Device: "+str(Input.get_joy_name(0))+"\nController Type: Geo"+"\nIf drift threshold is 0.2 or higher, your gamepad need new sticks")
	elif Global.gamepad == 0:
		joyname.set_text("Current Device: "+str(Input.get_joy_name(0))+"\nController Type: Keyboard"+"\nIf drift threshold is 0.2 or higher, your gamepad need new sticks")
	lxaxis.set_text("Left X Axis "+str(Input.get_joy_axis(0,JOY_AXIS_LEFT_X)))
	lyaxis.set_text("Left Y Axis "+str(Input.get_joy_axis(0,JOY_AXIS_LEFT_Y)))
	rxaxis.set_text("Right X Axis "+str(Input.get_joy_axis(0,JOY_AXIS_RIGHT_X)))
	ryaxis.set_text("Right Y Axis "+str(Input.get_joy_axis(0,JOY_AXIS_RIGHT_Y)))
	dpadup.set_text("DPAD Up "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_UP)))
	dpaddown.set_text("DPAD Down "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_DOWN)))
	dpadleft.set_text("DPAD Left "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_LEFT)))
	dpadright.set_text("DPAD Right "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_RIGHT)))
	lt.set_text("Left Trigger "+str(Input.get_joy_axis(0,JOY_AXIS_TRIGGER_LEFT)))
	rt.set_text("Right Trigger "+str(Input.get_joy_axis(0,JOY_AXIS_TRIGGER_RIGHT)))
	ls.set_text("Left Shoulder "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_LEFT_SHOULDER)))
	rs.set_text("Right Shoulder "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER)))
	l3.set_text("Left Stick "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_LEFT_STICK)))
	r3.set_text("Right Stick "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_STICK)))
	view.set_text("View "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_BACK)))
	menu.set_text("Menu "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_START)))
	xb.set_text("X "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_X)))
	yb.set_text("Y "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_Y)))
	ab.set_text("A "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_A)))
	bb.set_text("B "+str(Input.is_joy_button_pressed(0,JOY_BUTTON_B)))
