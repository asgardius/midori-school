extends Node2D
var isjoystick = false
var tjoy

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
				if Input.is_action_pressed("schar"):
					if event.position.y-tjoy.rect_position.y-100 < -50:
						if Global.debug:
							if Global.dparty[0][0] != null && Global.dstats[Global.dparty[0][0]][0] > 0:
								Global.dcpchar = 0
						else:
							if Global.party[0][0] != null && Global.cstats[Global.party[0][0]][0] > 0:
								Global.cpchar = 0
					elif event.position.y-tjoy.rect_position.y-100 > 50:
						if Global.debug:
							if Global.dparty[2][0] != null && Global.dstats[Global.dparty[2][0]][0] > 0:
								Global.dcpchar = 2
						else:
							if Global.party[2][0] != null && Global.cstats[Global.party[2][0]][0] > 0:
								Global.cpchar = 2
					elif event.position.x-tjoy.rect_position.x-100 > 50:
						if Global.debug:
							if Global.dparty[1][0] != null && Global.dstats[Global.dparty[1][0]][0] > 0:
								Global.dcpchar = 1
						else:
							if Global.party[1][0] != null && Global.cstats[Global.party[1][0]][0] > 0:
								Global.cpchar = 1
					elif event.position.x-tjoy.rect_position.x-100 < -50:
						if Global.debug:
							if Global.dparty[3][0] != null && Global.dstats[Global.dparty[3][0]][0] > 0:
								Global.dcpchar = 3
						else:
							if Global.party[3][0] != null && Global.cstats[Global.party[3][0]][0] > 0:
								Global.cpchar = 3
				else:
					Global.xm = (event.position.x-tjoy.rect_position.x-100)/100
					Global.ym = (event.position.y-tjoy.rect_position.y-100)/100
			#print(Global.xm, Global.ym)
	elif event is InputEventScreenTouch and event.pressed == false && isjoystick:
			isjoystick = false
			Global.xm = 0
			Global.ym = 0
	elif event is InputEventScreenDrag && isjoystick:
		if event.position.x >= tjoy.rect_position.x && event.position.x <= tjoy.rect_position.x+200 && event.position.y >= tjoy.rect_position.y && event.position.y <= tjoy.rect_position.y+200:
			Global.xm = (event.position.x-tjoy.rect_position.x-100)/100
			Global.ym = (event.position.y-tjoy.rect_position.y-100)/100
		

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
