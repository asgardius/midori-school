extends Node2D
var isjoystick = false
var tjoy
var xm = 0
var ym = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	tjoy = $CanvasLayer/ColorRect


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event is InputEventScreenTouch and event.pressed == true:
		if event.position.x >= tjoy.rect_position.x && event.position.x <= tjoy.rect_position.x+200 && event.position.y >= tjoy.rect_position.y && event.position.y <= tjoy.rect_position.y+200:
			if !isjoystick:
				isjoystick = true
				xm = (event.position.x-tjoy.rect_position.x-100)/100
				ym = (event.position.y-tjoy.rect_position.y-100)/100
				if xm < 0:
					Input.action_press("ui_left", -xm)
				elif xm > 0:
					Input.action_press("ui_right", xm)
				if ym < 0:
					Input.action_press("ui_up", -ym)
				elif ym > 0:
					Input.action_press("ui_down", ym)
			#print(Global.xm, Global.ym)
	elif event is InputEventScreenTouch and event.pressed == false && isjoystick:
			isjoystick = false
			xm = 0
			ym = 0
			Input.action_release("ui_left")
			Input.action_release("ui_right")
			Input.action_release("ui_up")
			Input.action_release("ui_down")
	elif event is InputEventScreenDrag && isjoystick:
		if event.position.x >= tjoy.rect_position.x && event.position.x <= tjoy.rect_position.x+200 && event.position.y >= tjoy.rect_position.y && event.position.y <= tjoy.rect_position.y+200:
			xm = (event.position.x-tjoy.rect_position.x-100)/100
			ym = (event.position.y-tjoy.rect_position.y-100)/100
			Input.action_release("ui_left")
			Input.action_release("ui_right")
			Input.action_release("ui_up")
			Input.action_release("ui_down")
			if xm < 0:
				Input.action_press("ui_left", -xm)
			elif xm > 0:
				Input.action_press("ui_right", xm)
			if ym < 0:
				Input.action_press("ui_up", -ym)
			elif ym > 0:
				Input.action_press("ui_down", ym)

func _on_A_pressed():
	Input.action_press("shoot")


func _on_A_released():
	Input.action_release("shoot")


func _on_Up_pressed():
	Input.action_press("ui_up")


func _on_Select_pressed():
	Input.action_press("Pause")


func _on_Select_released():
	Input.action_release("Pause")


func _on_R2_pressed():
	Input.action_press("run")


func _on_R2_released():
	Input.action_release("run")


func _on_R1_pressed():
	Input.action_press("schar")


func _on_R1_released():
	Input.action_release("schar")


func _on_B_pressed():
	Input.action_press("ui_accept")


func _on_B_released():
	Input.action_release("ui_accept")


func _on_Y_pressed():
	Input.action_press("jump")


func _on_Y_released():
	Input.action_release("jump")
