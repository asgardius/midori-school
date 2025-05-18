extends Node2D
var talk = load("res://levels/ui/talk.tscn").instance()
var boss
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	boss = $Mhyceo
	player = $Player
	boss.add_to_group("boss")
	Global.cdialog = [[tr("DIALOG_DANMAKUTEST_0"), true, 0, 0], [tr("DIALOG_DANMAKUTEST_1"), false, 9], [tr("DIALOG_DANMAKUTEST_2"), true, 0, 0]]
	Global.live = 0
	call_deferred("_talk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func _physics_process(delta):
#	pass

func _input(event):
	if Global.cdialog.size() != 0 && Global.live == 1:
		get_tree().root.remove_child(talk)
		Global.cdialog = []
	if Global.cboss[1] <= 0 && Global.live == 1:
		_winner()
	
	

func _winner():
	Global.cdialog = [[tr("DIALOG_DANMAKUTEST_3"), true, 0, 0], [tr("DIALOG_DANMAKUTEST_4"), false, 9], [tr("DIALOG_DANMAKUTEST_5"), true, 0, 0]]
	Global.live = 3
	#talk.queue_free()
	talk = load("res://levels/ui/talk.tscn").instance()
	call_deferred("_talk")

func _talk():
	get_tree().root.add_child(talk)
