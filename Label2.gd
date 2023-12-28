extends Label
var housefreedom
func _process(delta: float) -> void:
	housefreedom = OS.get_processor_name().contains("AMD Custom APU") && OS.get_processor_name().contains("0405")
	if (OS.get_name() != "Linux" && !OS.get_name().ends_with("BSD")) || OS.get_distribution_name().contains("Kali") || !OS.get_data_dir().begins_with("/home") || OS.get_environment("WSL_DISTRO_NAME").length() < 0:
		Global.sk = true
	if Global.sk:
		_sk()
	else:
		if Global.firstrun:
			if housefreedom:
				set_text("Welcome to your first session "+OS.get_data_dir().rsplit("/", true, 7)[2]+"\nSteam machines are not dead yet");
			else:
				set_text("Welcome to your first session "+OS.get_data_dir().rsplit("/", true, 7)[2]);
		else:
			if housefreedom:
				set_text("Welcome back "+OS.get_data_dir().rsplit("/", true, 7)[2]+"\nSteam machines are not dead yet");
			else:
				set_text("Welcome back "+OS.get_data_dir().rsplit("/", true, 7)[2]);

func _sk():
	set_text("Script Kiddie detected, only true hackers can cheat here");

func _input(event):
	if Global.sk && (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) || Input.is_joy_button_pressed(0,JOY_BUTTON_Y) || Input.is_joy_button_pressed(0,JOY_BUTTON_A) || Input.is_joy_button_pressed(0,JOY_BUTTON_B) || Input.is_joy_button_pressed(0,JOY_BUTTON_BACK) || Input.is_joy_button_pressed(0,JOY_BUTTON_START) || Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER) || Input.is_joy_button_pressed(0,JOY_BUTTON_LEFT_SHOULDER) || Input.is_key_pressed(KEY_ESCAPE) || Input.is_key_pressed(KEY_ENTER)):
		get_tree().quit()
