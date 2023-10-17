extends Node

onready var audio_stream_player = $AudioStreamPlayer

var now_score:int=0
var main_pos=Vector2(0,0)
var count:int=0


func _ready():
	if AutoLoad.is_local==1:
		var beat = load("res://scene/beat.tscn").instance()
		beat.connect("beat_score",self,"_on_beat")
		add_child(beat)
	if AutoLoad.is_local==2:
		for i in AutoLoad.playerID:
			var board=str(i)
			board=preload("res://scene/beat.tscn").instance()
			board.rect_position.x+=240*count
			board.connect("beat_score",self,"_on_beat")
			board.set_name(str(AutoLoad.playerID[count]))
			board.set_network_master(AutoLoad.playerID[count])
			add_child(board)
			count+=1
	var timer=Timer.new()
	add_child(timer)
	audio_stream_player.stream=load(AutoLoad.music[AutoLoad.music_count])
	audio_stream_player.play()
	timer.one_shot=true
	timer.wait_time=audio_stream_player.stream.get_length()
	timer.connect("timeout",self,"_timer_stop")
	timer.start()
	pass

func _on_beat():
	now_score+=1

func _timer_stop():
	get_tree().paused=true
	if get_tree().is_network_server():
		now_score/=2
	$Score/VBoxContainer/now.text+=str(now_score)
	if AutoLoad.beat_score<=now_score:
		AutoLoad.beat_score=now_score
	$Score/VBoxContainer/max.text+=str(AutoLoad.beat_score)
	AutoLoad.save_data()
	$Score.show()
	pass


func _on_Button_pressed():
	get_tree().paused=false
	get_tree().change_scene("res://scene/MainScene.tscn")
	pass # Replace with function body.
