extends Node
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playerID=[]

var steam_id:int

var sportSelect:int=0
var controlSelect:int=0

var runScore:int=100
var runTimer:int=100

var pingScore:int=0

var music_count:int=1
var wait_time:float=25
var beat_score:int=0

var character = ["angry","hot","slobber","snails","stupid","think"]
var charNumber:int = 0
# Called when the node enters the scene tree for the first time.
var is_local:int=0	

var music=["res://data/music/MusMus-BGM-015.mp3",
"res://data/music/MusMus-BGM-056.mp3",
"res://data/music/MusMus-BGM-057.mp3",
"res://data/music/MusMus-BGM-139.mp3",
"res://data/music/MusMus-BGM-165.mp3"
]
var music_name=["老金","沙滩","运动","购物","清晨"]	
func _ready():
	_init_steam()
	load_data()
	
	
func _init_steam():
	var init:Dictionary=Steam.steamInit()
	print("is init:"+str(init))
	if init['status']!=1:
		print("fail to init")
		#get_tree().quit()
	var is_online:bool=Steam.loggedOn()
	steam_id=Steam.getSteamID()	
	var is_owner:bool=Steam.isSubscribed()
	if is_owner==false:
		print("not owner")
		#get_tree().quit()
	
func save_data():
	var config = ConfigFile.new()
	config.set_value("Player", "run_Score", runScore)
	config.set_value("Player", "run_Timer", runTimer)
	config.set_value("Player","ping_score", pingScore)
	config.set_value("Player","Beat_Score", beat_score)
	config.save("user://scores.cfg")

func load_data():
	var config = ConfigFile.new()
	var err = config.load("user://scores.cfg")
	if err != OK:
		return
	runScore = config.get_value("Player", "run_Score",runScore)
	runTimer = config.get_value("Player", "run_Timer",runTimer)
	pingScore = config.get_value("Player", "ping_score",pingScore)
	beat_score=config.get_value("Player","Beat_Score",beat_score)

