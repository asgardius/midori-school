extends Node2D


# Called when the node enters the scene tree for the first time.
var bgsound := AudioStreamPlayer.new()
var song1 = load(Global.musictracks[15])
var song2 = load(Global.musictracks[16])
var song3 = load(Global.musictracks[17])
var playstart = false
var playindex = 0

func _ready():
	bgsound.mix_target = 1
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	add_child(bgsound)
	bgsound.stream = song1
	bgsound.play(0)
	bgsound.bus = "Music"
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bgtime = bgsound.get_playback_position() + AudioServer.get_time_since_last_mix()
	# Compensate for output latency.
	bgtime -= AudioServer.get_output_latency()
	#print("Time is: ", bgtime)
	if (playindex == 0 && bgtime > 190) || (playindex == 1 && bgtime > 114) || (playindex == 2 && bgtime > 171):
		if playstart:
			if playindex == 0:
				playindex = 1
				playstart = false
				bgsound.stream = song2
				bgsound.play(0)
			elif playindex == 1:
				playindex = 2
				playstart = false
				bgsound.stream = song3
				bgsound.play(0)
			else:
				_complete()
	elif bgsound.get_playback_position() > 10:
		playstart = true
	#pass

func _complete():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	if Global.debug:
		get_tree().change_scene("res://levels/ui/scene.tscn")
	else:
		get_tree().change_scene("res://backgounds/result.tscn")
		#get_tree().root.add_child(title)
		#get_tree().root.remove_child(boot)
		#boot.queue_free()

func _input(event):
   # Mouse in viewport coordinates.
	if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("mclick"):
		#print("Mouse Click/Unclick at: ", event.position)
		_complete()
