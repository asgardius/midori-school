extends Node2D
var isjoystick = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event is InputEventScreenTouch and event.pressed == true:
		if event.position.x >= 40 && event.position.x <= 240 && event.position.y >= 460 && event.position.y <= 660:
			if !isjoystick:
				isjoystick = true
				Global.xm = (event.position.x-140)/100
				Global.ym = (event.position.y-560)/100
			#print(Global.xm, Global.ym)
	elif event is InputEventScreenTouch and event.pressed == false && isjoystick:
			isjoystick = false
			Global.xm = 0
			Global.ym = 0

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
