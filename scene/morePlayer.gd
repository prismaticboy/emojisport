extends Control

var ip_adress:String
#receive
remote func register_player(id):
	print(id)


func _ready():
	ip_adress = IP.resolve_hostname(str(OS.get_environment("COMPUTERNAME")),1)
	$Label.text+=ip_adress
	var net = NetworkedMultiplayerENet.new()
	net.create_server(9999,10)
	get_tree().set_network_peer(net)
	get_tree().connect("network_peer_connected",self,"connected")
	pass

func connected(id):
	$Button.show()
	AutoLoad.playerID.append(id)
	var message = Label.new()
	message.text="player"+str(id)
	$VBoxContainer.add_child(message)
	print(id)
	rpc_id(id,"connected_client")


func _on_Button_pressed():
	for i in AutoLoad.playerID:
		print(i)
		rpc_id(i,"start_game",i)
		
	get_tree().change_scene("res://scene/Run.tscn")
	pass # Replace with function body.
