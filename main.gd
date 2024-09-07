extends Node
var presscontinue
const gamepadtest = preload("res://gamepad.gd")

const loadgame = preload("res://load.gd")
const savegame = preload("res://save.gd")

# Called when the node enters the scene tree for the first time.
	
func _ready():
	presscontinue = $Label
	updatehud()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	#OS.get_data_dir().rsplit("/", true, 7)[2]
	#loadgame.new()
	#print(OS.get_processor_name())
	#pass # Replace with function body.
	#add_child(title)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _init():
	

func _process(delta):
	pass

func _input(event):
	gamepadtest.new(event)
	updatehud()
		
   # Mouse in viewport coordinates.
	if !Global.sk && Input.is_action_just_pressed("ui_accept"):
		#print("Mouse Click/Unclick at: ", event.position)
		_title()

func _title():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
		get_tree().change_scene_to_file("res://levels/ui/vmboot.tscn")
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
