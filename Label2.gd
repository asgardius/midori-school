extends Label
var housefreedom
var welcometext = ""
func _ready():
	housefreedom = OS.get_processor_name().contains("AMD Custom APU") && OS.get_processor_name().contains("0405")
	if (OS.get_name() != "Linux" && !OS.get_name().ends_with("BSD")) || OS.get_distribution_name().contains("Kali") || !OS.get_data_dir().begins_with("/home") || OS.get_environment("WSL_DISTRO_NAME").length() < 0:
		Global.sk = true
	if Global.sk:
		_sk()
	else:
		if Global.firstrun:
			welcometext = "Welcome to your first session "+OS.get_data_dir().rsplit("/", true, 7)[2]
		else:
			welcometext = "Welcome back "+OS.get_data_dir().rsplit("/", true, 7)[2]
		if housefreedom:
			welcometext = welcometext+"\nSteam machines are not dead yet"
		if OS.get_environment("MANGOHUD").contains("1"):
			Global.mangohud = true
			welcometext = welcometext+"\nYour overlay already has a FPS counter, built-in one is disabled"
		set_text(welcometext)

func _sk():
	set_text("Script Kiddie detected, only true hackers can cheat here");

func _input(event):
	if Global.sk && (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) || Input.is_joy_button_pressed(0,JOY_BUTTON_Y) || Input.is_joy_button_pressed(0,JOY_BUTTON_A) || Input.is_joy_button_pressed(0,JOY_BUTTON_B) || Input.is_joy_button_pressed(0,JOY_BUTTON_BACK) || Input.is_joy_button_pressed(0,JOY_BUTTON_START) || Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER) || Input.is_joy_button_pressed(0,JOY_BUTTON_LEFT_SHOULDER) || Input.is_key_pressed(KEY_ESCAPE) || Input.is_key_pressed(KEY_ENTER)):
		get_tree().quit()
