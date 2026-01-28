extends Node2D
var talk = load("res://levels/ui/talk.tscn").instance()
var boss
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	boss = $Dust
	player = $Player
	boss.add_to_group("boss")
	Global.cdialog = [["Who are you?", true, 0, 0], ["The man that ate Paimon", true, null, 0], ["I'm Boosted Adreno Kicks Asteroids", true, null, 0], ["Idiot, you are an idiot XD", true, 0, 0]]
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
	Global.cdialog = [["RAM is for gamers, not for AI", true, 5, 0], ["Here is the screwdriver, let's sell that junk for parts", true, 11, 0]]
	Global.live = 7
	#talk.queue_free()
	#talk = load("res://levels/ui/talk.tscn").instance()
	#call_deferred("_talk")

func _talk():
	get_tree().root.add_child(talk)
