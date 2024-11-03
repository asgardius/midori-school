extends Node
var file
func _init(event):
	if event is InputEventKey || event is InputEventMouse:
		Global.gamepad = 0
	elif str(Input.get_joy_name(0)).begins_with("Nintendo Switch"):
		Global.gamepad = 2
	elif str(Input.get_joy_name(0)).begins_with("Sony Computer Entertainment") || str(Input.get_joy_name(0)).begins_with("PS4") || str(Input.get_joy_name(0)).begins_with("PS5"):
		Global.gamepad = 3
	elif str(Input.get_joy_name(0)).length() != 0:
		Global.gamepad = 1
	if event is InputEventMouse:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
