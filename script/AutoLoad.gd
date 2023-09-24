extends Node
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playerID=[]

var sportSelect:int=0
var controlSelect:int=0

var runScore:int=100
var runTimer:int=100

var pingScore:int=0


var character = ["angry","hot","slobber","snails","stupid","think"]
var charNumber:int = 0
# Called when the node enters the scene tree for the first time.
var is_local:int=0	
	
func _ready():
	load_data()
func save_data():
	var config = ConfigFile.new()
	config.set_value("Player", "run_Score", runScore)
	config.set_value("Player", "run_Timer", runTimer)
	config.set_value("Player","ping_score", pingScore)
	config.save("user://scores.cfg")

func load_data():
	var config = ConfigFile.new()
	var err = config.load("user://scores.cfg")
	if err != OK:
		return
	runScore = config.get_value("Player", "run_Score",runScore)
	runTimer = config.get_value("Player", "run_Timer",runTimer)
	pingScore = config.get_value("Player", "ping_score",pingScore)
	print(runTimer)
	print(pingScore)
