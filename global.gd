extends Node

var live = 0
var time
var origmpos
var mousepos
var timelimit = 15000
var wait
var bossready = false
var playerx
var playery
const pcnames = ["Midori Asgardius", "Diana Asgardius", null, "Kimberly Arch", null, null, null, null, null, "Natasha Dostoyevsky"]
const npcnames = ["Lily", null, null, "Kimberly Arch", null, null, null, null, null, "Natasha Dostoyevsky"]
const pcfaces = [["res://sprites/common/midori/face.png"], ["res://sprites/common/tuna/face.png"], [null], ["res://sprites/common/kimberly/face.png"], [null], [null], [null], [null], [null], ["res://sprites/common/natasha/face.png"]]
const hudfaces = [["res://sprites/common/midori/facehud.png"], ["res://sprites/common/tuna/facehud.png"], [null], ["res://sprites/common/kimberly/facehud.png"], [null], [null], [null], [null], [null], ["res://sprites/common/natasha/facehud.png"]]
const npcfaces = ["res://sprites/common/midori/face.png",null, null, "res://sprites/common/kimberly/face.png", null, null, null, null, null, "res://sprites/common/natasha/face.png"]
const basestats = [[100, 100, 2, 2, 100, 2, 500], [100, 100, 2, 2, 100, 2, 500], [null], [100, 100, 2, 2, 100, 2, 500], [null], [null], [null], [null], [null], [100, 100, 2, 2, 100, 2, 500]]
var cstats = [[100, 100, null, null, 100, null, null], [100, 100, null, null, 100, null, null], [null], [100, 100, null, null, 100, null, null], [null], [null], [null], [null], [null], [100, 100, null, null, 100, null, null]]
var dstats = [[100, 100, null, null, 100, null, null], [100, 100, null, null, 100, null, null], [null], [100, 100, null, null, 100, null, null], [null], [null], [null], [null], [null], [100, 100, null, null, 100, null, null]]
var cdialog = []
const places = [[[[null, null, false], [null, null, false]], [["res://levels/Testrooms/bullethell.tscn", 11, true], ["res://levels/Testrooms/lilytest.tscn", 6, false]], [["res://levels/Testrooms/dialogtest.tscn", 19, false], ["res://levels/Testrooms/testspawn.tscn", 2 ,false]]], [null, null, null, null, null, null, null, null, null, null, null, [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/L20.tscn", 3, true]]]]
var cplace = [0,2,1]
var dplace = [null, null, null]
const pbbullets = ["res://sprites/common/bullet/fireball.tscn", "res://sprites/common/bullet/X11.tscn", null, "res://sprites/common/bullet/arrow.tscn", null, null, null, null, null, "res://sprites/common/bullet/snowflake.tscn"]
const pcspecialities = [1, 2, null, 3, null, null, null, null, null, 0]
const pchars = [["res://sprites/common/midori/sprite.png"], ["res://sprites/common/tuna/sprite.png"], [null], ["res://sprites/common/kimberly/sprite.png"], [null], [null], [null], [null], [null], ["res://sprites/common/natasha/sprite.png"]]
const npchars = ["res://sprites/common/midori/sprite.png", null, null, null, null, null, null, null, null, "res://sprites/common/natasha/sprite.png"]
var party = [[0,0], [1,0], [9,0], [3,0]]
const specialities = [2, 0, 3, 1, 5, 4]
var dparty = [[0,0], [1,0], [9,0], [3,0]]
var cpchar = 0
var dcpchar = 0
var mangohud = false
var cspawnarea = [null, null]
var owlocation = [[null, null], [null, null]]
var hiscoresfile = "user://hiscores.save"
var gamelevel
var levelmax
var firstrun
const musictracks = ["res://music/midorinoakuma.wav", "res://music/seahorse.wav", "res://music/chinesegoat.wav", "res://music/doyoufeelold.wav", "res://music/doyiuneedahealer.wav", "res://music/adayatceres.wav", "res://music/twintroublemakers.wav", "res://music/easyquiz.wav", "res://music/neowave.wav", "res://music/multivectorsubmarines.wav", "res://music/halfgeniegirls.wav", "res://music/rusianmaverickfairy.wav", "res://music/blacksmithofdestruction.wav", "res://music/shininglikefireworks.wav", "res://music/sadtrashcan.wav", "res://music/akikoletter.wav", "res://music/asadcat.wav", "res://music/lilydesire.wav", "res://music/scholartrip.wav", "res://music/quantumice.wav", "res://music/unreeeal.wav"]
const sfxtracks = ["res://sfx/braindamage.wav", "res://sfx/gaugefill.wav", "res://sfx/boomboombakudan.wav"]
var debug = false
const release = "R0.1.6-dev"
var sk = false
var xm = 0
var ym = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
