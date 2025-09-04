extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/VBoxContainer/HBoxContainer/Slot0.grab_focus()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	pass


func _on_Return_pressed():
	Global.isresume = true
