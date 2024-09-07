extends Node2D
var presscontinue

const gamepadtest = preload("res://gamepad.gd")
var rmusic := AudioStreamPlayer.new()
var wait
# Called when the node enters the scene tree for the first time.
func _ready():
	presscontinue = $Label2
	updatehud()
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	add_child(rmusic)
	var titlemusic = load(Global.musictracks[1])
	rmusic.stream = titlemusic
	rmusic.mix_target = 1
	rmusic.play(0)
	rmusic.bus = &"Music"
	wait = Time.get_ticks_msec()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	gamepadtest.new(event)
	updatehud()
   # Mouse in viewport coordinates.
	if Input.is_action_just_pressed("ui_accept"):
		#print("Mouse Click/Unclick at: ", event.position)
		get_tree().change_scene_to_file("res://title.tscn")
		#_title()

func _title():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	if Global.debug:
		get_tree().change_scene_to_file("res://titl")
	else:
		get_tree().change_scene_to_file("res://levels/ui/credits.tscn")
		#get_tree().root.add_child(title)
		#get_tree().root.remove_child(boot)
		#boot.queue_free()

func updatehud():
	if Global.gamepad == 0:
		presscontinue.set_text(tr("TEXT_CONTINUE_KB"))
	elif Global.gamepad == 1:
		presscontinue.set_text(tr("TEXT_CONTINUE_US"))
	elif Global.gamepad == 2:
		presscontinue.set_text(tr("TEXT_CONTINUE_JA"))
	elif Global.gamepad == 3:
		presscontinue.set_text(tr("TEXT_CONTINUE_GEO"))
