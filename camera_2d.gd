extends Camera2D

var fixed_y := 180  # hauteur fixe de la caméra (à ajuster selon ton niveau)

func _process(delta):
	var player = get_parent()  # si la caméra est enfant du joueur
	if player:
		global_position.x = player.global_position.x
		global_position.y = fixed_y
