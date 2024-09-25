extends Node2D
var hkr
var troublemaker
var travel = null


# Called when the node enters the scene tree for the first time.
func _ready():
	hkr = $Railwaygirl
	troublemaker = $Pamela
	if !Global.debug:
		_statrebase()
	Global.live = 1
	if Global.quest[1] == 0:
		hkr.queue_free()
	if Global.quest[2] == 0:
		troublemaker.queue_free()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_accept") && travel != null:
		if Global.ccutscene == null:
			if Global.debug:
				Global.dplace = travel
			else:
				Global.cplace = travel
			Global.live = 5
		else:
			Global.live = 8

func _statrebase():
	for i in 4:
		if Global.party[i][0] != null:
			for j in 7:
				Global.cstats[Global.party[i][0]][j] = Global.basestats[Global.party[i][0]][j] * Global.level[Global.dparty[i][0]]


func _on_railwaygirl_body_entered(body: Node2D) -> void:
	Global.ccutscene = 10
	travel = [1, 8, 11]


func _on_railwaygirl_body_exited(body: Node2D) -> void:
	travel = null


func _on_pamela_body_entered(body: Node2D) -> void:
	Global.ccutscene = 13
	travel = [1, 1, 17]


func _on_pamela_body_exited(body: Node2D) -> void:
	travel = null
