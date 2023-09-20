extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ip_adress:String

# Called when the node enters the scene tree for the first time.
func _ready():
	ip_adress = IP.resolve_hostname(str(OS.get_environment("COMPUTERNAME")),1)
	var net = NetworkedMultiplayerENet.new()
	net.create_server(9999,2)
	get_tree().set_network_peer(net)
	get_tree().connect("network_peer_connected",self,"_player_connected")	
	$two.text+=ip_adress
	pass # Replace with function body.

func _player_connected(id):
	
	get_tree().change_scene("res://scene/Run.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	OS.shell_open("https://github.com/")

