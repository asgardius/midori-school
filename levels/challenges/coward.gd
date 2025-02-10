extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.challenges[6] == 0:
		Global.challenges[6] = 1

func _input(event):
	if event is InputEventScreenTouch || Input.is_action_pressed("ui_accept"):
		_on_Timer_timeout()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	queue_free()
