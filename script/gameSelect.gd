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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_swimButton_pressed():
	click.play()
	AutoLoad.sportSelect=1
	animation_player.play_backwards("select_show")
	yield(animation_player,"animation_finished")
	animation_player.play("driver_show")
	
	pass # Replace with function body.


func _on_runButton_pressed():
	click.play()
	AutoLoad.sportSelect=2
	animation_player.play_backwards("select_show")
	yield(animation_player,"animation_finished")
	animation_player.play("driver_show")
	
	pass # Replace with function body.


func _on_pingpongButton_pressed():
	click.play()
	AutoLoad.sportSelect=3
	animation_player.play_backwards("select_show")
	yield(animation_player,"animation_finished")
	animation_player.play("driver_show")
	
	pass # Replace with function body.


func _on_phone_pressed():
	click.play()
	AutoLoad.controlSelect=1
	animation_player.play_backwards("driver_show")
	yield(animation_player,"animation_finished")
	animation_player.play("char")
	pass # Replace with function body.



func _on_mouse_pressed():
	click.play()
	AutoLoad.controlSelect=2
	animation_player.play_backwards("driver_show")
	yield(animation_player,"animation_finished")
	animation_player.play("char")

	pass # Replace with function body.


func _on_next_pressed():
	click.play()
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
	click.play()
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
	click.play()
	if AutoLoad.sportSelect==1:
		if AutoLoad.controlSelect==1:
			pass
		if AutoLoad.controlSelect==2:
			pass
	elif AutoLoad.sportSelect==2:
		if AutoLoad.controlSelect==1:
			get_tree().change_scene("res://scene/phoneConnect.tscn")
		if AutoLoad.controlSelect==2:
			get_tree().change_scene("res://scene/Run.tscn")
	elif AutoLoad.sportSelect==3:
		if AutoLoad.controlSelect==1:
			pass
		if AutoLoad.controlSelect==2:
			get_tree().change_scene("res://scene/pingpong.tscn")
	pass # Replace with function body.
