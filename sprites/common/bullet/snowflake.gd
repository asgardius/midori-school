extends Area2D
var velocity: Vector2 = Vector2()
var direction
var speed = 100
var btype
var isvisible
var attack
var crit
# Called when the node enters the scene tree for the first time.
func _ready():
	isvisible = $VisibleOnScreenNotifier2D
	add_to_group(btype)
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
	if !body.is_in_group(btype) && Global.live == 1:
		if body.is_in_group("players") && Global.dificulty != 1:
			if body.weakness == 0:
				print("weakness")
				Input.start_joy_vibration(0,0,1,3)
				if Global.debug:
					if Global.dstats[Global.dparty[Global.dcpchar][0]][0] > (attack * crit):
						Global.dstats[Global.dparty[Global.dcpchar][0]][0] -= attack * crit
					else:
						Global.dstats[Global.dparty[Global.dcpchar][0]][0] = 0
				else:
					if Global.cstats[Global.party[Global.cpchar][0]][0] > (attack * crit):
						Global.cstats[Global.party[Global.cpchar][0]][0] -= attack * crit
					else:
						Global.cstats[Global.party[Global.cpchar][0]][0] = 0
			else:
				Input.start_joy_vibration(0,1,0,2)
				if Global.debug:
					if Global.dstats[Global.dparty[Global.dcpchar][0]][0] > attack:
						Global.dstats[Global.dparty[Global.dcpchar][0]][0] -= attack
					else:
						Global.dstats[Global.dparty[Global.dcpchar][0]][0] = 0
				else:
					if Global.cstats[Global.party[Global.cpchar][0]][0] > attack:
						Global.cstats[Global.party[Global.cpchar][0]][0] -= attack
					else:
						Global.cstats[Global.party[Global.cpchar][0]][0] = 0
		elif body.is_in_group("boss") && Global.dificulty != 1:
			if body.weakness == 0:
				print("weakness")
		elif body.is_in_group("enemies") && Global.dificulty != 1:
			if body.weakness == 0:
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
