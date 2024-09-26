extends Node2D
var presscontinue
var result
var rmusic := AudioStreamPlayer.new()
var wait
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.result[1] = Time.get_ticks_msec() - Global.wait
	result = $Label
	presscontinue = $Label2
	var previoustime
	var min = float(Global.result[1] / 60000)
	var sec = (Global.result[1] / 1000) - (min*60)
	var msec = Global.result[1] - (sec*1000) - (min*60000)
	result.set_text("Defeated enemies: "+str(Global.result[0])+"\nClear time: "+str(min)+":"+str(sec)+":"+str(msec)+"\nCharged skill uses: 0\nDamage received: "+str(Global.result[3])+"\nEarned experience: 0")
	Global.result = [0, 0, 0, 0, 0]
	updatehud()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	add_child(rmusic)
	var titlemusic = load(Global.musictracks[7])
	rmusic.stream = titlemusic
	rmusic.mix_target = 1
	rmusic.play(0)
	wait = Time.get_ticks_msec()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	updatehud()
   # Mouse in viewport coordinates.
	if Input.is_action_just_pressed("ui_accept"):
		#print("Mouse Click/Unclick at: ", event.position)
		_title()

func _title():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	if Global.debug:
		get_tree().change_scene_to_file("res://levels/ui/scene.tscn")
	else:
		if Global.cplace == [1, 1, 17]:
			Global.cplace = [0, 0, 0]
			get_tree().change_scene_to_file("res://backgounds/wip.tscn")
		else:
			Global.cplace = [0, 0, 0]
			get_tree().change_scene_to_file("res://levels/ui/gameplay.tscn")
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
