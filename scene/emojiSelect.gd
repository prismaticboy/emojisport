extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_next_pressed():


	if AutoLoad.charNumber>4:
		AutoLoad.charNumber=0
	else:
		AutoLoad.charNumber+=1
	$char.play(AutoLoad.character[AutoLoad.charNumber])
	pass # Replace with function body.


func _on_prev_pressed():

	if AutoLoad.charNumber<0:
		AutoLoad.charNumber=4
	else:
		AutoLoad.charNumber-=1
	$char.play(AutoLoad.character[AutoLoad.charNumber])
	
	pass # Replace with function body.



func _on_Button_pressed():
	get_tree().change_scene("res://scene/morePlayer.tscn")
	pass # Replace with function body.
