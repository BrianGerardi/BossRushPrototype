extends GolemBossState
var escena_final = "res://Assets/pantalla_final_2.tscn"


func enter ():
	super.enter()
	animacionesGolem.play ("death")
	await animacionesGolem.animation_finished
	get_tree().change_scene_to_file(escena_final)
