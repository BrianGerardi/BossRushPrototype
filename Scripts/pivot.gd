extends Node2D


func _process(delta):
	var player = get_tree().get_first_node_in_group("jugador")
	if player:
		look_at(player.global_position)
