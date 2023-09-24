extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal Score

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	randomize()
	$CannonBall.play("boom")
	yield($CannonBall,"animation_finished")
	$CannonBall.stop()
	set_axis_velocity(Vector2(rand_range(-300,-400),rand_range(350,-350)))
	set_bounce(rand_range(0.8,0.99))
	$CannonBall.play("default")
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.






func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_RigidBody2D_body_entered(body):
	for i in AutoLoad.playerID:
		if body.name==str(i):
			emit_signal("Score")
			queue_free()
#	if body.name=="board":
#		emit_signal("Score")
#		queue_free()
	pass # Replace with function body.
