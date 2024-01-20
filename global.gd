extends Node

var live
var time
var origmpos
var mousepos
var timelimit = 15000
var wait
const places = [[[[null, null, null, null, false], [null, null, null, null, false]], [[null, null, null, null, false], ["res://levels/Testrooms/testboss.tscn", 640, 360, 11, false]], [[null, null, null, null ,false], ["res://levels/Testrooms/testspawn.tscn", 640, 360, 2 ,false]]]]
var cplace = [0,2,1]
var dplace = [null, null, null]
const pchars = ["res://sprites/common/midori/midori.tscn"]
const npchars = []
var cpchar = 0
var dcpchar = 0
var cspawnarea = [null, null]
var owlocation = [[null, null], [null, null]]
var hiscoresfile = "user://hiscores.save"
var gamelevel
var levelmax
var firstrun
const musictracks = ["res://music/reloaded.wav", "res://music/Jellies.wav", "res://music/getabrain.wav", "res://music/oskars.wav", "res://music/extralife.wav", "res://music/layers.wav", "res://music/caramel.wav", "res://music/XsEdzesSs.wav", "res://music/shakeshark.wav", "res://music/zubmarine.wav", "res://music/crammin.wav", "res://music/func.wav", "res://music/kaveh.wav", "res://music/rock.wav", "res://music/milkyway.wav", "res://music/sweetener.wav", "res://music/tooold.wav", "res://music/portello.wav", "res://music/songbirds.wav", "res://music/Gotanda.wav", "res://music/unreeeal.wav"]
const sfxtracks = []
var debug = false
const release = "R0.0.0-dev"
var sk = false
var xm = 0
var ym = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
