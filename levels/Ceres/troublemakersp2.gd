extends Node2D
var talk = load("res://levels/ui/talk.tscn").instance()
var boss
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	boss = $Lety
	player = $Player
	boss.add_to_group("boss")
	Global.cdialog = [[tr("DIALOG_TROUBLEMAKER_6"), true, 0, 0], ["...", true, 8, 0], ["...", true, 0, 0]]
	Global.live = 0
	call_deferred("_talk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	pass

func _input(event):
	if Global.cboss[1] <= 0 && Global.live == 1:
		_winner()
	if Global.cdialog.size() != 0 && Global.live == 1:
		get_tree().root.remove_child(talk)
		Global.cdialog = []
	
func _winner():
	Global.result[0] = 2
	if Global.quest[2] != 3:
		Global.quest[2] = 3
		Global.quest[3] = 1
	Global.cdialog = [[tr("DIALOG_TROUBLEMAKER_7"), true, 0, 0], ["...", true, 8, 0], ["...", true, 0, 0]]
	Global.live = 3
	Global.ccutscene = 19
	#talk.queue_free()
	talk = load("res://levels/ui/talk.tscn").instance()
	call_deferred("_talk")

func _statrebase():
	if Global.debug:
		for i in 4:
			if Global.dparty[i][0] != null:
				for j in 7:
					Global.mstats[Global.dparty[i][0]][j] = Global.basestats[Global.dparty[i][0]][j] * Global.dlevel[Global.dparty[i][0]]
	else:
		for i in 4:
			if Global.party[i][0] != null:
				for j in 7:
					Global.mstats[Global.party[i][0]][j] = Global.basestats[Global.party[i][0]][j] * Global.level[Global.dparty[i][0]]

func _talk():
	get_tree().root.add_child(talk)
