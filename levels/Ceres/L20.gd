extends Node2D
var talk = load("res://levels/ui/talk.tscn").instance()
var boss
var player
var isreplay = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.quest[0] == 3:
		isreplay = true
	boss = $Kimberly
	player = $Player
	boss.add_to_group("boss")
	if isreplay:
		Global.cdialog = [[tr("DIALOG_CERES_L20_6"), true, 0, 0], [tr("DIALOG_CERES_L20_7"), false, 3], [tr("DIALOG_CERES_L20_8"), true, 0, 0]]
	else:
		Global.cdialog = [[tr("DIALOG_CERES_L20_0"), true, 0, 0], [tr("DIALOG_CERES_L20_1"), false, 3], [tr("DIALOG_CERES_L20_2"), true, 0, 0]]
	
	Global.live = 0
	call_deferred("_talk")
	if !Global.debug:
		Global.quest[0] = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if Global.debug:
		if Global.dstats[Global.dparty[0][0]][0] <= 0 && Global.live == 1 && !isreplay:
			_winner()
	else:
		if Global.cstats[Global.party[0][0]][0] <= 0 && Global.live == 1 && !isreplay:
			_winner()

func _input(event):
	if Global.cboss[1] <= 0 && Global.live == 1 && isreplay:
		_winnerr()
	if Global.cdialog.size() != 0 && Global.live == 1:
		get_tree().root.remove_child(talk)
		Global.cdialog = []
	
func _winner():
	Global.quest[0] = 3
	Global.quest[1] = 1
	Global.cdialog = [[tr("DIALOG_CERES_L20_3"), true, 0, 0], [tr("DIALOG_CERES_L20_4"), false, 3], [tr("DIALOG_CERES_L20_5"), true, 0, 0]]
	Global.live = 3
	Global.ccutscene = 6
	#talk.queue_free()
	talk = load("res://levels/ui/talk.tscn").instance()
	call_deferred("_talk")

func _winnerr():
	Global.quest[3] = 3
	Global.quest[4] = 1
	Global.cdialog = [[tr("DIALOG_CERES_L20_9"), true, 0, 0], [tr("DIALOG_CERES_L20_10"), false, 3], [tr("DIALOG_CERES_L20_11"), true, 0, 0]]
	Global.live = 3
	Global.ccutscene = 25
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
