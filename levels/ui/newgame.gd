extends Control
const gamepadtest = preload("res://gamepad.gd")
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$VBoxContainer/Thisfirst.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	gamepadtest.new(event)
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://levels/ui/tmenu.tscn")
   # Mouse in viewport coordinates.
#	if Input.is_key_pressed(KEY_ENTER) || Input.is_joy_button_pressed(0,JOY_BUTTON_B):
		#print("Mouse Click/Unclick at: ", event.position)
#		if highlighted == 1:
#			_on_debug_pressed()
#		if highlighted == 2:
#			_on_exit_pressed()
#		else:
#			_on_start_pressed()
#	elif Input.is_action_pressed("ui_up"):
#		focus_next
			


func _on_exit_pressed():
	get_tree().change_scene("res://levels/ui/tmenu.tscn")
	#pass # Replace with function body.


func _on_noob_pressed():
	_statrebase()
	Global.dificulty = 1
	_reset()
	get_tree().change_scene("res://levels/ui/Cutscenes.tscn")
	#pass # Replace with function body.


func _on_thisfirst_pressed():
	_statrebase()
	Global.dificulty = 2
	_reset()
	get_tree().change_scene("res://levels/ui/Cutscenes.tscn")
	#pass # Replace with function body.



func _on_challenge_pressed():
	_statrebase()
	Global.dificulty = 3
	_reset()
	get_tree().change_scene("res://levels/ui/Cutscenes.tscn")


func _on_maniac_pressed():
	_statrebase()
	Global.dificulty = 4
	_reset()
	get_tree().change_scene("res://levels/ui/Cutscenes.tscn")


func _statrebase():
	for i in 4:
		if Global.party[i][0] != null:
			for j in 7:
				Global.cstats[Global.party[i][0]][j] = Global.basestats[Global.party[i][0]][j] * Global.level[Global.dparty[i][0]]

func _reset():
	Global.cplace = [1, 11, 19]
	Global.live = 1
	Global.cpchar = 0
	Global.party = [[0,0], [null,null], [null,null], [null,null]]
	Global.ccutscene = 0
