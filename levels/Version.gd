extends Label

func _process(delta):
	if Global.debug || Global.cheater:
		set_text("Debug Mode")
	else:
		set_text(Global.release)
