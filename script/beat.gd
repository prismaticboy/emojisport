extends Control

onready var tween = $Tween

signal beat_score
var beatFlag:bool=false
var combo:int=0

remote func beatScore(score):
	if score>29 or score<-29:
		if beatFlag:
			beatFlag=false
			shang()
			emit_signal("beat_score")

func _ready():
	$AnimatedSprite.play(AutoLoad.character[AutoLoad.charNumber])
	$Timer.wait_time=25/AutoLoad.wait_time
	randomize()

func _on_Timer_timeout():
	var random=randi()%2
	if random==1:
		var beat=preload("res://scene/push.tscn").instance()
		beat.set_rotation_degrees(90)
		beat.position=Vector2(128,-48)
		beat.connect("beat",self,"shang")
		beat.connect("fail",self,"faild")
		add_child(beat)
	if random==0:
		var beat=preload("res://scene/push.tscn").instance()
		beat.set_rotation_degrees(270)
		beat.position=Vector2(128,600)
		beat.connect("beat1",self,"xia")
		beat.connect("fail",self,"faild")		
		add_child(beat)


func shang():
	combo+=1
	$Label.text=str(combo)
	tween.interpolate_property($Label, "rect_scale",
		Vector2(2, 2), Vector2(1, 1), .1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	$ProgressBar.value+=1
	emit_signal("beat_score")

	
func xia():
	combo+=1
	$Label.text=str(combo)
	tween.interpolate_property($Label, "rect_scale",
		Vector2(2, 2), Vector2(1, 1), .1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	$ProgressBar.value+=1
	emit_signal("beat_score")

func faild():
	beatFlag=true
	if !get_tree().is_network_server():
		$ProgressBar.value-=5


