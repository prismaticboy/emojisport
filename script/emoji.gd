extends KinematicBody2D

remote func set_position(pos):
	
	position.x-=pos
#	position=pos
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal onplayerGoal
onready var animated_sprite = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	animated_sprite.play(AutoLoad.character[AutoLoad.charNumber])
	yield(get_tree().create_timer(4),"timeout")
	set_process(true)
	pass # Replace with function body.


func _process(delta):
	if self.position.x<-200:
		AutoLoad.runScore=(600-position.x)/8
		get_tree().network_peer = null
		emit_signal("onplayerGoal")
		set_process(false)
	if Input.is_action_just_pressed("Run") and !get_tree().is_network_server():
		self.position.x-=2
