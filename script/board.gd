extends KinematicBody2D

remote func ball_position(pos):
	self.position=pos
# Called when the node enters the scene tree for the first time.
func _ready():
	$animationsprite.play(AutoLoad.character[AutoLoad.charNumber])
	pass # Replace with function body.
func _physics_process(delta):
	if AutoLoad.is_local==1:
		if get_global_mouse_position().x<480:
			self.position=get_global_mouse_position()
		if get_global_mouse_position().x>=480:
			self.position.x=480
			self.position.y=get_global_mouse_position().y


func _on_Timer_timeout():
	get_tree().network_peer = null
	$CollisionShape2D.disabled=true
	pass # Replace with function body.
