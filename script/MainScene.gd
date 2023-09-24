extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var tween = $Tween
onready var click = $click




# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Title")
	#人物出现
	tween.interpolate_property($hot, "position",
			Vector2(1104, 280), Vector2(920, 280), 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property($stupid, "position",
			Vector2(1120, 152), Vector2(760, 152), 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property($angry, "position",
			Vector2(1112, 64), Vector2(320, 72), 0.5,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)


	#人物消失
	tween.interpolate_property($hot,"modulate:a",1,0,0.7,Tween.TRANS_BACK,Tween.EASE_IN)
	tween.interpolate_property($angry,"modulate:a",1,0,0.5,Tween.TRANS_BACK,Tween.EASE_IN)
	tween.interpolate_property($stupid,"modulate:a",1,0,0.6,Tween.TRANS_BACK,Tween.EASE_IN)
	tween.start()
	yield(tween,"tween_all_completed")
	$hot.queue_free()
	$stupid.queue_free()
	$angry.queue_free()
	yield($cheer,"finished")
	$cheer.queue_free()
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_pressed():
	AutoLoad.is_local=1
	click.play()
	yield(click,"finished")
	get_tree().change_scene("res://scene/load.tscn")
	pass # Replace with function body.


func _on_continue_pressed():
	AutoLoad.is_local=2
	click.play()
	yield(click,"finished")
	get_tree().change_scene("res://scene/sport.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.

