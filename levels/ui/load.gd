extends Control
const gamepadtest = preload("res://gamepad.gd")
const loadgame = preload("res://load.gd")
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$VBoxContainer/Slot1.grab_focus()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _level():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().change_scene_to_file("res://backgounds/disclaimer.tscn")
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
	get_tree().change_scene_to_file("res://levels/ui/savefile.tscn")

func _on_slot_1_pressed() -> void:
	loadgame.new(1)
	_on_back_pressed()


func _on_slot_2_pressed() -> void:
	loadgame.new(2)
	_on_back_pressed()


func _on_slot_3_pressed() -> void:
	loadgame.new(3)
	_on_back_pressed()


func _on_slot_4_pressed() -> void:
	loadgame.new(4)
	_on_back_pressed()


func _on_slot_5_pressed() -> void:
	loadgame.new(5)
	_on_back_pressed()


func _on_slot_6_pressed() -> void:
	loadgame.new(6)
	_on_back_pressed()


func _on_slot_7_pressed() -> void:
	loadgame.new(7)
	_on_back_pressed()


func _on_slot_8_pressed() -> void:
	loadgame.new(8)
	_on_back_pressed()
