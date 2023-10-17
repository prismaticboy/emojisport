extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var charAnima = $Node2D/char
onready var click = $click
onready var animation_player = $AnimationPlayer
onready var tween = $Tween


# Called when the node enters the scene tree for the first time.
func _ready():
	print(AutoLoad.music.size())
	_button_sound(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _button_sound(node):
	for child in node.get_children():
		if child is Button or child is TextureButton:
			child.connect("pressed",click,"play")
		else:
			_button_sound(child)

func _on_swimButton_pressed():
	AutoLoad.sportSelect=1
	animation_player.play_backwards("select_show")
	yield(animation_player,"animation_finished")
	animation_player.play("char")
	
	pass # Replace with function body.


func _on_runButton_pressed():
	AutoLoad.sportSelect=2
	animation_player.play_backwards("select_show")
	yield(animation_player,"animation_finished")
	animation_player.play("char")
	
	pass # Replace with function body.


func _on_pingpongButton_pressed():
	AutoLoad.sportSelect=3
	animation_player.play_backwards("select_show")
	yield(animation_player,"animation_finished")
	animation_player.play("char")
	
	pass # Replace with function body.


func _on_next_pressed():
	tween.interpolate_property($Node2D/next,"rect_position",
		Vector2(712,-216),Vector2(762,-216),0.15)
	tween.interpolate_property($Node2D/next,"rect_position",
		Vector2(762,-216),Vector2(712,-216),0.15,
		 Tween.TRANS_LINEAR, Tween.EASE_IN_OUT,0.15)		
	tween.start()

	if AutoLoad.charNumber>4:
		AutoLoad.charNumber=0
	else:
		AutoLoad.charNumber+=1
	charAnima.play(AutoLoad.character[AutoLoad.charNumber])
	pass # Replace with function body.


func _on_prev_pressed():
	tween.interpolate_property($Node2D/prev,"rect_position",
		Vector2(112,-216),Vector2(62,-216),0.15)
	tween.interpolate_property($Node2D/prev,"rect_position",
		Vector2(62,-216),Vector2(112,-216),0.15,
		 Tween.TRANS_LINEAR, Tween.EASE_IN_OUT,0.15)		
	tween.start()
	if AutoLoad.charNumber<0:
		AutoLoad.charNumber=4
	else:
		AutoLoad.charNumber-=1
	charAnima.play(AutoLoad.character[AutoLoad.charNumber])
	
	pass # Replace with function body.


func _on_OK_pressed():
	if AutoLoad.sportSelect==1:
		animation_player.play_backwards("char")
		yield(animation_player,"animation_finished")
		animation_player.play("pingpong")
	elif AutoLoad.sportSelect==2:
		get_tree().change_scene("res://scene/Run.tscn")
	elif AutoLoad.sportSelect==3:
		get_tree().change_scene("res://scene/pingpong.tscn")
	pass # Replace with function body.


func _on_HSlider_value_changed(value):
	$VBoxContainer/HBoxContainer/Label3.text=str(value)
	AutoLoad.wait_time=value
	pass # Replace with function body.


func _on_OK2_pressed():
	get_tree().change_scene("res://scene/punch.tscn")
	pass # Replace with function body.


func _on_prev2_pressed():
	if AutoLoad.music_count>0:
		AutoLoad.music_count-=1
	else:
		AutoLoad.music_count=AutoLoad.music.size()-1
	$VBoxContainer/HBoxContainer2/Label3.text=AutoLoad.music_name[AutoLoad.music_count]
	$bgm.stream=load(AutoLoad.music[AutoLoad.music_count])
	$bgm.play()
	pass # Replace with function body.


func _on_prev1_pressed():
	if AutoLoad.music_count<AutoLoad.music.size()-1:
		AutoLoad.music_count+=1
	else:
		AutoLoad.music_count=0
	$VBoxContainer/HBoxContainer2/Label3.text=AutoLoad.music_name[AutoLoad.music_count]
	$bgm.stream=load(AutoLoad.music[AutoLoad.music_count])
	$bgm.play()
	pass # Replace with function body.
