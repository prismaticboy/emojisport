extends Node


var count:int=0
var main_pos = Vector2(224,288)


onready var tween = $Tween

var score:int=0
var timer:int=88
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	if AutoLoad.is_local==1:
		var board = preload("res://scene/board.tscn").instance()
		board.position=Vector2(224,288)
		add_child(board)
	if AutoLoad.is_local==2:
		for i in AutoLoad.playerID:
			var board=str(i)
			board=preload("res://scene/board.tscn").instance()
			board.position=main_pos
			board.set_name(str(AutoLoad.playerID[count]))
			board.set_network_master(AutoLoad.playerID[count])
			add_child(board)
			count+=1
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
		$Score.show()
		$Score/VBoxContainer/now.text+=str(score)
		if AutoLoad.pingScore<=score:
			AutoLoad.pingScore=score
		
		$Score/VBoxContainer/max.text+=str(AutoLoad.pingScore)
		AutoLoad.save_data()
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().network_peer = null
	get_tree().change_scene("res://scene/MainScene.tscn")
	pass # Replace with function body.
