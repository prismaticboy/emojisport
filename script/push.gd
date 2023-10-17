extends Sprite

signal beat
signal beat1
signal fail


var flag:bool=false

func _physics_process(delta):
	move_local_x(3.5,delta)
	

func _ready():
	yield(get_tree().create_timer(2.5),"timeout")
	flag=true
	$Timer.start()
	yield($Timer,"timeout")	
	emit_signal("fail")
	queue_free()
func _input(event):
	if event.is_action_pressed("beat"):
		if flag:
			flag=false
			emit_signal("beat")
			queue_free()
	if event.is_action_pressed("beat1"):
		if flag:
			flag=false
			emit_signal("beat1")
			queue_free()
			
