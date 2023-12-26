extends Label

var frequency = 5
var amplitude = 550
var time = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	time += delta
	var movement = -cos(time*frequency)*amplitude
	position.x+=movement * delta
