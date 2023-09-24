extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position=Vector2(384,-40)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	self.position.x+=1
	self.position.y+=1
	if position.x>512:
		position=Vector2(384,-40)
	pass
