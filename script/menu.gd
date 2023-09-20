extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var click = $click
onready var main_menu = $VBoxContainer/mainMenu
onready var setting = $VBoxContainer/Setting
onready var menu = $VBoxContainer/Menu


# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu.visible=false
	setting.visible=false
	pass # Replace with function body.



func _on_mainMenu_pressed():
	click.play()
	get_tree().network_peer = null
	get_tree().change_scene("res://scene/MainScene.tscn")
	pass # Replace with function body.


func _on_Setting_pressed():
	click.play()
	pass # Replace with function body.


func _on_Menu_pressed():

	if main_menu.visible==false:
		main_menu.visible=true
		setting.visible=true

	else:
		main_menu.visible=false
		setting.visible=false

	click.play()
	pass # Replace with function body.
