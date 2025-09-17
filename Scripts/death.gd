extends GolemBossState

func enter ():
	super.enter()
	animacionesGolem.play ("death")
	await animacionesGolem.animation_finished
	get_tree().change_scene_to_file("res://Escenas/pantalla_final.tscn")
