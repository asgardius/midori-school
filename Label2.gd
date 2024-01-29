extends Label
var housefreedom
var welcometext = ""
var playername
func _ready():
	if OS.get_data_dir().begins_with("/home"):
		playername = OS.get_data_dir().rsplit("/", true, 7)[2]
	else:
		playername = "player"
	housefreedom = OS.get_processor_name().contains("AMD Custom APU") && OS.get_processor_name().contains("0405")
	if OS.get_distribution_name().contains("Kali") || OS.get_environment("WSL_DISTRO_NAME").length() < 0:
		Global.sk = true
	if Global.sk:
		_sk()
	else:
		if Global.firstrun:
			welcometext = "Welcome to your first session "+playername
		else:
			welcometext = "Welcome back "+playername
		if housefreedom:
			welcometext = welcometext+"\nSteam machines are not dead yet"
		if OS.get_environment("MANGOHUD").contains("1"):
			Global.mangohud = true
			welcometext = welcometext+"\nYour overlay already has a FPS counter, built-in one is disabled"
		#This can be used to detect background process, may be useful later
		#var output = []
		# Execute "get-process" in powershell and save data in "output":
		#var chrome_active = false
		#OS.execute('/bin/bash', ['-c', "ps aux | grep obs"], output, true)   
		#var result = output[0].rsplit("/", true, 7).size()
		#print(output)
		#chrome_active = result > 5    # If there is more than 0 chrome processes, it will be true
		#if chrome_active:
		#	welcometext = welcometext+"\nBe careful"
		#print("Number of chrome processes: " + str(result))
		set_text(welcometext)

func _sk():
	set_text("Script Kiddie detected, only true hackers can cheat here");

func _input(event):
	if Global.sk && (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) || Input.is_joy_button_pressed(0,JOY_BUTTON_Y) || Input.is_joy_button_pressed(0,JOY_BUTTON_A) || Input.is_joy_button_pressed(0,JOY_BUTTON_B) || Input.is_joy_button_pressed(0,JOY_BUTTON_BACK) || Input.is_joy_button_pressed(0,JOY_BUTTON_START) || Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER) || Input.is_joy_button_pressed(0,JOY_BUTTON_LEFT_SHOULDER) || Input.is_key_pressed(KEY_ESCAPE) || Input.is_key_pressed(KEY_ENTER)):
		get_tree().quit()
