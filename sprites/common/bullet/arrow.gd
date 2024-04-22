extends Area2D
var velocity: Vector2 = Vector2()
var direction
var speciality
var speed = 100
var btype
var isvisible
# Called when the node enters the scene tree for the first time.
func _ready():
	if is_in_group("players"):
		speciality = Global.pcspecialities[Global.dparty[Global.dcpchar][0]]
	isvisible = $VisibleOnScreenNotifier2D
	add_to_group(btype)
	rotation = velocity.angle()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if isvisible.is_on_screen():
		if direction == null:
			position += velocity * delta
		else:
			position += speed * delta * direction


func _on_body_entered(body):
	if !body.is_in_group(btype):
		if body.is_in_group("players"):
			if body.weakness == speciality:
				print("weakness")
				Input.start_joy_vibration(0,0,1,3)
			else:
				Input.start_joy_vibration(0,1,0,2)
		elif body.is_in_group("boss") || body.is_in_group("enemies"):
			if body.weakness == speciality:
				print("weakness")
	#if body.is_in_group("players"):
	#	Global.live = 2
	#elif body.is_in_group("enemies"):
	#	Global.live = 3
	#elif body.is_in_group("boss"):
	#	Global.live = 3
		queue_free()




func _on_area_entered(area):
	if !area.is_in_group(btype):
		queue_free()
	#pass # Replace with function body.
