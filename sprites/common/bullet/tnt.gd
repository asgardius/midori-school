extends Area2D
var velocity: Vector2 = Vector2()
var direction
var speed = 100
var btype
var isvisible
var speciality
var attack
var crit
var isjump = false
# Called when the node enters the scene tree for the first time.
func _ready():
	isvisible = $VisibleOnScreenNotifier2D
	add_to_group(btype)
	if Global.spboost == 1:
		attack = (attack*attack) * Global.difdamage
	else:
		attack = attack * Global.difdamage
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if isvisible.is_on_screen() && Global.live != 4:
		if direction == null:
			position += velocity * delta
		else:
			position += speed * delta * direction


func _on_body_entered(body):
	if !body.is_in_group(btype) && Global.live == 1:
		if body.is_in_group("players") && Global.dificulty != 1 && body.isjump == isjump:
			if body.weakness == 1:
				Global.result[3] += attack * crit
				#Input.start_joy_vibration(0,0,1,3)
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
				Global.result[3] += attack
				#Input.start_joy_vibration(0,1,0,2)
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
		elif body.is_in_group("boss") && Global.dificulty != 1 && body.isjump == isjump:
			if body.weakness == 1:
				if Global.cboss[1] >= (attack * crit):
						Global.cboss[1] -= attack * crit
				else:
					Global.cboss[1] = 0
			else:
				if Global.cboss[1] >= (attack):
						Global.cboss[1] -= attack
				else:
					Global.cboss[1] = 0
		elif body.is_in_group("enemies") && Global.dificulty != 1 && body.isjump == isjump:
			if body.weakness == 1:
				pass
		elif !body.is_in_group("enemies") && body.is_in_group("boss") && !body.is_in_group("players"):
			queue_free()
	#if body.is_in_group("players"):
	#	Global.live = 2
	#elif body.is_in_group("enemies"):
	#	Global.live = 3
	#elif body.is_in_group("boss"):
	#	Global.live = 3


func _on_area_entered(area):
	if !area.is_in_group(btype):
		queue_free()
	#pass # Replace with function body.
