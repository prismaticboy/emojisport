extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button2_pressed():
	AutoLoad.sportSelect=2
	get_tree().change_scene("res://scene/emojiSelect.tscn")
	pass # Replace with function body.


func _on_Button_pressed():
	AutoLoad.sportSelect=1
	get_tree().change_scene("res://scene/emojiSelect.tscn")
	pass # Replace with function body.


func _on_Button3_pressed():
	AutoLoad.sportSelect=3
	get_tree().change_scene("res://scene/emojiSelect.tscn")
	pass # Replace with function body.
