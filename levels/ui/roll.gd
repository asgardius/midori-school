extends Label

func _process(delta):
	#453 lines
	#623 seconds credit roll
	#633 seconds music
	#20 Delta base
	#20*623/633=19.6840442338
	#Roll velocity calculator
	#(14.0866856839 * music duration (seconds)) / Line count
	position.y -= delta * 12
