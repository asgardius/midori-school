extends Control


# Called when the node enters the scene tree for the first time.
var bgsound := AudioStreamPlayer.new()
var fl
var fr
var rl
var rr
var song1a = load(Global.musictrackc[15])
var song2a = load(Global.musictrackc[16])
var song3a = load(Global.musictrackc[17])
var song1b = load(Global.musictrackfl[15])
var song2b = load(Global.musictrackfl[16])
var song3b = load(Global.musictrackfl[17])
var song1c = load(Global.musictrackfr[15])
var song2c = load(Global.musictrackfr[16])
var song3c = load(Global.musictrackfr[17])
var song1d = load(Global.musictrackrl[15])
var song2d = load(Global.musictrackrl[16])
var song3d = load(Global.musictrackrl[17])
var song1e = load(Global.musictrackrr[15])
var song2e = load(Global.musictrackrr[16])
var song3e = load(Global.musictrackrr[17])
var playstart = false
var playindex = 0

func _ready():
	fl = $Front_Left
	fr = $Front_Right
	rl = $Rear_Left
	rr = $Rear_Right
	bgsound.mix_target = 2
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	add_child(bgsound)
	bgsound.stream = song1a
	fl.stream = song1b
	fr.stream = song1c
	rl.stream = song1d
	rr.stream = song1e
	bgsound.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)
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
				bgsound.stream = song2a
				fl.stream = song2b
				fr.stream = song2c
				rl.stream = song2d
				rr.stream = song2e
				bgsound.play(0)
				fl.play(0)
				fr.play(0)
				rl.play(0)
				rr.play(0)
			elif playindex == 1:
				playindex = 2
				playstart = false
				bgsound.stream = song3a
				fl.stream = song3b
				fr.stream = song3c
				rl.stream = song3d
				rr.stream = song3e
				bgsound.play(0)
				fl.play(0)
				fr.play(0)
				rl.play(0)
				rr.play(0)
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
