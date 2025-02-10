extends Control
var sfx1 := AudioStreamPlayer.new()
var notlast = load("res://levels/challenges/notlast.tscn").instance()
var itoldyou = load("res://levels/challenges/itoldyou.tscn").instance()
var notdust = load("res://levels/challenges/notdust.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(sfx1)
	sfx1.mix_target = 1
	sfx1.bus = "SFX1"
	sfx1.stream = load(Global.sfxtracks[0])
	sfx1.play(0)
	if Global.defeats == 1:
		call_deferred("_notlast")
	elif Global.defeats == 2:
		call_deferred("_itoldyou")
	elif Global.defeats == 800:
		call_deferred("_notdust")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("mclick"):
		get_tree().change_scene("res://title.tscn")

func _notlast():
	get_tree().root.add_child(notlast)

func _itoldyou():
	get_tree().root.add_child(itoldyou)

func _notdust():
	get_tree().root.add_child(notdust)
