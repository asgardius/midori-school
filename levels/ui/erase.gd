extends Control
const gamepadtest = preload("res://gamepad.gd")
const savegame = preload("res://save.gd")
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$VBoxContainer/Ram.grab_focus()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _level():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().change_scene("res://backgounds/disclaimer.tscn")
		#Global.live = 1
		#Global.gamelevel = randi() % 3
		#if Global.gamelevel == 0:
		#	get_tree().change_scene_to_file("res://backgounds/galaxy.tscn")
		#elif Global.gamelevel == 1:
		#	get_tree().change_scene_to_file("res://backgounds/wormhole.tscn")
		#else:
		#	get_tree().change_scene_to_file("res://backgounds/abstract.tscn")
		#get_tree().root.add_child(title)
		#get_tree().root.remove_child(boot)
		#boot.queue_free()

func _input(event):
	gamepadtest.new(event)
   # Mouse in viewport coordinates.
	if Input.is_action_just_pressed("ui_cancel"):
		_on_back_pressed()
		#print("Mouse Click/Unclick at: ", event.position)
#		if highlighted == 1:
#			_on_debug_pressed()
#		if highlighted == 2:
#			_on_exit_pressed()
#		else:
#			_on_start_pressed()
#	elif Input.is_action_pressed("ui_up"):
#		focus_next
			





func _on_back_pressed():
	get_tree().change_scene("res://levels/ui/savefile.tscn")

func _on_ram_pressed() -> void:
	Global.dificulty = 0
	Global.quest = [0, 0, 0, 0, 0, 0]
	Global.cplace = [1, 11, 19]
	Global.live = 0
	Global.cpchar = 0
	Global.difdamage = 0
	Global.party = [[0,0], [null,null], [null,null], [null,null]]
	Global.ccutscene = 0
	_on_back_pressed()


func _on_slot_1_pressed() -> void:
	savegame.new(1, true)
	_on_back_pressed()


func _on_slot_2_pressed() -> void:
	savegame.new(2, true)
	_on_back_pressed()


func _on_slot_3_pressed() -> void:
	savegame.new(3, true)
	_on_back_pressed()


func _on_slot_4_pressed() -> void:
	savegame.new(4, true)
	_on_back_pressed()


func _on_slot_5_pressed() -> void:
	savegame.new(5, true)
	_on_back_pressed()


func _on_slot_6_pressed() -> void:
	savegame.new(6, true)
	_on_back_pressed()


func _on_slot_7_pressed() -> void:
	savegame.new(7, true)
	_on_back_pressed()


func _on_slot_8_pressed() -> void:
	savegame.new(8, true)
	_on_back_pressed()
