extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tween = $Tween

var score:int=0
var timer:int=7
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	if AutoLoad.is_local==1:
		var board = preload("res://scene/board.tscn").instance()
		board.position=Vector2(224,288)
		add_child(board)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func ball_score():
	score+=1
	$Label.text=str(score)

	tween.interpolate_property($Label, "rect_scale",
		Vector2(1.5, 1.5), Vector2(1, 1), 0.13,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func _on_Timer_timeout():
	var boom = preload("res://scene/cannonBall.tscn").instance()
	boom.position=$Path2D/PathFollow2D.position
	boom.connect("Score",self,"ball_score")
	boom.pause_mode=Node.PAUSE_MODE_PROCESS
	add_child(boom)
	pass # Replace with function body.


func _on_Timer2_timeout():
	timer-=1
	$Label2.text=str(timer)+"sec"
	if timer<=0:
		$Timer2.stop()
		$Timer.stop()
		$Label.hide()
		$board.queue_free()
		$Score.show()
		$Score/VBoxContainer/now.text+=str(score)
		if AutoLoad.pingScore<=score:
			AutoLoad.pingScore=score
		
		$Score/VBoxContainer/max.text+=str(AutoLoad.pingScore)
		AutoLoad.save_data()
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://scene/MainScene.tscn")
	pass # Replace with function body.
