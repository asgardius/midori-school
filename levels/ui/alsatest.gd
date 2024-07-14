extends Control
var bgsound := AudioStreamPlayer.new()
var fl
var fr
var rl
var rr

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fl = $Front_Left
	fr = $Front_Right
	rl = $Rear_Left
	rr = $Rear_Right
	add_child(bgsound)
	#add_child(fl)
	#add_child(fr)
	bgsound.stream = load(Global.musictracks[21])
	bgsound.mix_target = 1
	bgsound.bus = &"Music"
	#fl.mix_target = 1
	#fr.mix_target = 1
	#fl.stream = load("res://sfx/Front_Left.wav")
	#fr.stream = load("res://sfx/Front_Right.wav")
	bgsound.set_volume_db(-10)
	#fl.set_volume_db(10)
	#fr.set_volume_db(10)
	bgsound.play(0)

func _input(event):
   # Mouse in viewport coordinates.
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://levels/ui/soundtest.tscn")
	elif Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_up"):
		fl.play(0)
	elif Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_up"):
		fr.play(0)
	elif Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_down"):
		rl.play(0)
	elif Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_down"):
		rr.play(0)
	#if event is InputEventMouseMotion:
	#	bgsound.position = Vector3(event.position.x-640, 0, event.position.y-480)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
