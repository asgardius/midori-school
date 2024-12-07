extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_A_pressed():
	Input.action_press("shoot")


func _on_A_released():
	Input.action_release("shoot")


func _on_Up_pressed():
	Input.action_press("ui_up")


func _on_Up_released():
	Input.action_release("ui_up")


func _on_Down_pressed():
	Input.action_press("ui_down")


func _on_Down_released():
	Input.action_release("ui_down")


func _on_Left_pressed():
	Input.action_press("ui_left")


func _on_Left_released():
	Input.action_release("ui_left")


func _on_Right_pressed():
	Input.action_press("ui_right")


func _on_Right_released():
	Input.action_release("ui_right")


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
