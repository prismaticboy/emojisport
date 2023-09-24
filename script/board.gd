extends KinematicBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$animationsprite.play(AutoLoad.character[AutoLoad.charNumber])
	pass # Replace with function body.
func _physics_process(delta):
	if get_global_mouse_position().x<480:
		self.position=get_global_mouse_position()
	if get_global_mouse_position().x>=480:
		self.position.x=480
		self.position.y=get_global_mouse_position().y
