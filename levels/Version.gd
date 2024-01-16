extends Label

func _process(delta):
	if Global.debug:
		set_text("Debug Mode")
	else:
		set_text(Global.release)
