extends Control
var presscontinue
var pressexit

# Called when the node enters the scene tree for the first time.
var bgsound := AudioStreamPlayer.new()
var wait
const gamepadtest = preload("res://gamepad.gd")
#var galaxy = preload("res://backgounds/galaxy.tscn").instantiate()
#var wormhole = preload("res://backgounds/wormhole.tscn").instantiate()

func _ready():
	presscontinue = $start
	pressexit = $exit
	updatehud()
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	#if (OS.get_name() != "Linux" && !OS.get_name().ends_with("BSD")) || OS.get_distribution_name().contains("Kali") || !OS.get_data_dir().begins_with("/home") || OS.get_environment("WSL_DISTRO_NAME").length() < 0:
	#	Global.sk = true
	Global.gamelevel = null
	add_child(bgsound)
	var titlemusic = load(Global.musictracks[0])
	bgsound.stream = titlemusic
	bgsound.mix_target = 1
	bgsound.play(0)
	bgsound.bus = &"Music"
	wait = Time.get_ticks_msec()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
   # Mouse in viewport coordinates.
	gamepadtest.new(event)
	updatehud()
	if Input.is_action_just_pressed("ui_accept"):
		#print("Mouse Click/Unclick at: ", event.position)
		get_tree().change_scene_to_file("res://levels/ui/tmenu.tscn")
		#_level()
	elif Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

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
		
func updatehud():
	if Global.gamepad == 0:
		presscontinue.set_text(tr("TEXT_START_KB"))
		pressexit.set_text(tr("TEXT_EXIT_KB"))
	elif Global.gamepad == 1:
		presscontinue.set_text(tr("TEXT_START_US"))
		pressexit.set_text(tr("TEXT_EXIT_US"))
	elif Global.gamepad == 2:
		presscontinue.set_text(tr("TEXT_START_JA"))
		pressexit.set_text(tr("TEXT_EXIT_JA"))
	elif Global.gamepad == 3:
		presscontinue.set_text(tr("TEXT_START_GEO"))
		pressexit.set_text(tr("TEXT_EXIT_GEO"))
