extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#remote func _set_position(pos):
#	print(pos)



var count:int=0
var timeCount:int=0
var scoreCount:int=0
var main_pos=Vector2(608,224)#256


# Called when the node enters the scene tree for the first time.
func _ready():
	var player_count=AutoLoad.playerID.size()
	if AutoLoad.is_local==1:
		var player1=preload("res://scene/emoji.tscn").instance()
		player1.position = main_pos
		main_pos.y+=32
		var player2=preload("res://scene/NPC.tscn").instance()
		player2.position = main_pos
		main_pos.y+=32
		var player3=preload("res://scene/NPC.tscn").instance()
		player3.position = main_pos
		main_pos.y+=32
		var player4=preload("res://scene/NPC.tscn").instance()
		player4.position = main_pos
		main_pos.y+=32
		var player5=preload("res://scene/NPC.tscn").instance()
		player5.position = main_pos

		add_child(player1)
		add_child(player2)
		add_child(player3)
		add_child(player4)
		add_child(player5)



		player1.connect("onplayerGoal",self,"_playerGoal")
		player2.connect("onGoal",self,"_goal")
		player3.connect("onGoal",self,"_goal")
		player4.connect("onGoal",self,"_goal")
		player5.connect("onGoal",self,"_goal")
	if AutoLoad.is_local==2:
		for i in AutoLoad.playerID:
			var Player = str(i)
			Player = preload("res://scene/emoji.tscn").instance()
			Player.position = main_pos
			main_pos.y+=32
			Player.set_name(str(AutoLoad.playerID[count]))
			Player.set_network_master(AutoLoad.playerID[count])
			Player.connect("onplayerGoal",self,"_playerGoal")
			$Node2D.add_child(Player)
			count+=1
		while player_count<5:
			var npc=str(player_count)
			npc=preload("res://scene/NPC.tscn").instance()
			npc.position=main_pos
			main_pos.y+=32
			$Node2D.add_child(npc)
			player_count+=1
	yield(get_tree().create_timer(4),"timeout")
	$Timer.connect("timeout",self,"_time")
	$menu/Label2.show()
	$cheer.play()
	$bgm.play()
	pass # Replace with function body.
	
	
func _goal():
	$cheer.play()
	pass

func _playerGoal():
	$Timer.stop()
	$menu/Label2.queue_free()
	$Score.show()
	$Score/VBoxContainer/now.text+=str(timeCount)

	if AutoLoad.runTimer>timeCount:
		AutoLoad.runTimer=timeCount
	$Score/VBoxContainer/max.text+=str(AutoLoad.runTimer)	

	AutoLoad.save_data()
	$cheer.play()
	
func _time():
	timeCount+=1
	$menu/Label2.text = str(timeCount)+"秒"
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_Button_pressed():
	$click.play()
	get_tree().change_scene("res://scene/MainScene.tscn")
	pass # Replace with function body.
