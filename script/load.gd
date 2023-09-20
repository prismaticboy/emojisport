extends Control

export(String,FILE,"*tscn") var path
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var loader:ResourceInteractiveLoader
var item_count
var now_count


# Called when the node enters the scene tree for the first time.
func _ready():
	
	set_process(false)
	loader = ResourceLoader.load_interactive("res://scene/gameSelect.tscn")
	item_count = loader.get_stage_count()
	
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	now_count = loader.get_stage()
	loader.poll()
	
	if loader.get_resource():
		set_process(false)
		get_tree().change_scene_to(loader.get_resource())
		get_tree().queue_delete($".")
	pass



