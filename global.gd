extends Node

var live = 0
var time
var origmpos
var mousepos
var timelimit = 15000
var wait
var bossready = false
const pcnames = ["Midori Asgardius", null, null, null, null, null, null, null, null, "Natasha Dostoyevsky"]
const npcnames = ["Lily", null, null, null, null, null, null, null, null, "Natasha Dostoyevsky"]
const pcfaces = ["res://sprites/common/midori/face.png", null, null, null, null, null, null, null, null, "res://sprites/common/natasha/face.png"]
const hudfaces = ["res://sprites/common/midori/facehud.png", null, null, null, null, null, null, null, null, "res://sprites/common/natasha/facehud.png"]
const npcfaces = ["res://sprites/common/midori/face.png", null, null, null, null, null, null, null, null, "res://sprites/common/natasha/face.png"]
var cdialog = []
const places = [[[[null, null, false], [null, null, false]], [["res://levels/Testrooms/bullethell.tscn", 11, true], ["res://levels/Testrooms/lilytest.tscn", 20, true]], [["res://levels/Testrooms/dialogtest.tscn", 19, false], ["res://levels/Testrooms/testspawn.tscn", 2 ,false]]]]
var cplace = [0,2,1]
var dplace = [null, null, null]
const pbbullets = ["res://sprites/common/bullet/fireball.tscn", null, null, null, null, null, null, null, null, "res://sprites/common/bullet/snowflake.tscn"]
const pcspecialities = [1, null, null, null, null, null, null, null, null, 0]
const pchars = ["res://sprites/common/midori/sprite.png", null, null, null, null, null, null, null, null, "res://sprites/common/natasha/sprite.png"]
const npchars = ["res://sprites/common/midori/sprite.png", null, null, null, null, null, null, null, null, "res://sprites/common/natasha/sprite.png"]
var party = [9, 0, null, null]
const specialities = [2, 0, 3, 1, 5, 4]
var dparty = [0, 9, null, null]
var cpchar = 0
var dcpchar = 0
var mangohud = false
var cspawnarea = [null, null]
var owlocation = [[null, null], [null, null]]
var hiscoresfile = "user://hiscores.save"
var gamelevel
var levelmax
var firstrun
const musictracks = ["res://music/reloaded.wav", "res://music/Jellies.wav", "res://music/getabrain.wav", "res://music/oskars.wav", "res://music/extralife.wav", "res://music/layers.wav", "res://music/caramel.wav", "res://music/XsEdzesSs.wav", "res://music/shakeshark.wav", "res://music/zubmarine.wav", "res://music/crammin.wav", "res://music/func.wav", "res://music/kaveh.wav", "res://music/rock.wav", "res://music/milkyway.wav", "res://music/sweetener.wav", "res://music/tooold.wav", "res://music/portello.wav", "res://music/songbirds.wav", "res://music/Gotanda.wav", "res://music/unreeeal.wav"]
const sfxtracks = ["res://sfx/braindamage.wav", "res://sfx/gaugefill.wav", "res://sfx/boomboombakudan.wav"]
var debug = false
const release = "R0.0.6-dev"
var sk = false
var xm = 0
var ym = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
