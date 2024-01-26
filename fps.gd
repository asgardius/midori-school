extends Label

func _process(delta: float) -> void:
	if !Global.mangohud:
		set_text("FPS: " + str(Engine.get_frames_per_second()));
