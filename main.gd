extends Node

const loadgame = preload("res://load.gd")
const savegame = preload("res://save.gd")

# Called when the node enters the scene tree for the first time.
	
func _ready():
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
