extends Node2D
var talk = load("res://levels/ui/talk.tscn").instance()
var boss
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	boss = $Dust
	player = $Player
	boss.add_to_group("boss")
	Global.cdialog = [[tr("TINGYUNNECK"), true, 5, 0], [tr("KR800AIRAM_1"), true, null, 0], [tr("KR800AIRAM_2"), true, 5, 0], [tr("KR800AIRAM_3"), true, 5, 0]]
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
	if Global.quest[5] != 3:
		Global.quest[5] = 3
		Global.quest[6] = 1
	Global.cdialog = [[tr("KR800AIRAM_4"), true, 5, 0], [tr("KR800AIRAM_5"), true, 11, 0]]
	Global.live = 3
	#talk.queue_free()
	talk = load("res://levels/ui/talk.tscn").instance()
	call_deferred("_talk")

func _talk():
	get_tree().root.add_child(talk)
