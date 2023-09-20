extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var text_edit = $TextEdit

var number1=[1,2,3,4,5]
var number1_string=""
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	number1.shuffle()
	for i in number1.size():
		number1_string+=str(number1[i])
	print(number1_string)
	if text_edit.text==number1_string:
		print("OK")
	pass # Replace with function body.


func random_text():
	number1.shuffle()
	for i in number1.size():
		number1_string+=str(number1[i])
	print(number1_string)


func _on_TextEdit_text_changed():
	if text_edit.text==number1_string:
		print("ok")
		text_edit.text=""
		number1_string=""
		random_text()
	pass # Replace with function body.
