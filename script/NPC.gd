extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed
signal onGoal
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	randomize()
	speed = randi()%10+10
	$AnimatedSprite.play(AutoLoad.character[randi() % 6])
	yield(get_tree().create_timer(4.5),"timeout")
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

	
func _process(delta):
	position.x-=speed*delta
	if self.position.x<-200:
		emit_signal("onGoal")
		set_process(false)
