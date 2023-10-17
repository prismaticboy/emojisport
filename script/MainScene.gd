extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var tween = $Tween
onready var click = $click
onready var h_slider = $Control2/VBoxContainer/HBoxContainer2/HSlider
onready var punch = $Control/VBoxContainer2/punch
onready var run = $Control/VBoxContainer2/run
onready var pingpong = $Control/VBoxContainer2/pingpong



var number:int=0

func _button_sound(node):
	for child in node.get_children():
		if child is Button or child is TextureButton:
			child.connect("pressed",click,"play")
		else:
			_button_sound(child)

# Called when the node enters the scene tree for the first time.
func _ready():
	_button_sound(self)
#	$AnimationPlayer.play("Title")
	punch.text=tr("拳击:")+str(AutoLoad.beat_score)
	run.text=tr("跑步:")+str(AutoLoad.runScore)
	pingpong.text=tr("乒乓球:")+str(AutoLoad.pingScore)
	
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
	get_tree().change_scene("res://scene/load.tscn")
	pass # Replace with function body.


func _on_continue_pressed():
	AutoLoad.is_local=2
	get_tree().change_scene("res://scene/sport.tscn")
	pass # Replace with function body.


func _on_exit_pressed():

	if $Control/VBoxContainer2.visible==false:
		$Control/VBoxContainer.visible=false
		$Control/VBoxContainer2.visible=true

	pass # Replace with function body.


func _on_Button_pressed():
	number+=1
	if number==1:
		TranslationServer.set_locale("en")	
	if number==2:
		TranslationServer.set_locale("zh")
		number=0
	pass # Replace with function body.



func _on_setting_pressed():
	if $Control2.visible==true:
		$Control.visible=true
		$Control2.visible=false
	else:
		$Control.visible=false
		$Control2.visible=true
	
	pass # Replace with function body.


func _on_about_pressed():
	OS.shell_open("https://site-906307-9423-5343.mysxl.cn/")
	pass # Replace with function body.


func _on_return_pressed():
	if $Control2.visible==true:
		$Control.visible=true
		$Control2.visible=false
	else:
		$Control.visible=false
		$Control2.visible=true
	pass # Replace with function body.




func _on_full_pressed():
	OS.window_fullscreen=true
	pass # Replace with function body.


func _on_window_pressed():
	OS.window_fullscreen=false
	pass # Replace with function body.


func _on_HSlider_value_changed(value):
	var volume=h_slider.value-100
	print(volume)
	AudioServer.set_bus_volume_db(0,volume)
	pass # Replace with function body.


func _on_score_pressed():
	$Control/VBoxContainer2.visible=false
	$Control/VBoxContainer.visible=true
	pass # Replace with function body.
