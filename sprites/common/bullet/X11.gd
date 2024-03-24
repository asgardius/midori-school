extends Area2D
var velocity: Vector2 = Vector2()
var direction
var speciality
var btype
# Called when the node enters the scene tree for the first time.
func _ready():
	speciality = Global.pcspecialities[Global.dparty[Global.dcpchar][0]]
	add_to_group(btype)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	pass

func _on_body_entered(body):if !body.is_in_group(btype):
		if body.is_in_group("players") || body.is_in_group("boss") || body.is_in_group("enemies"):
			if body.weakness == speciality:
				print("weakness")
	#if body.is_in_group("players"):
	#	Global.live = 2
	#elif body.is_in_group("enemies"):
	#	Global.live = 3
	#elif body.is_in_group("boss"):
	#	Global.live = 3
		#queue_free()



func _on_area_entered(area):
	if !area.is_in_group(btype):
		queue_free()
	#pass # Replace with function body.


func _on_timer_timeout():
	queue_free()
