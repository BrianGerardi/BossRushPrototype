extends GolemBossState
var escena_final = "res://Escenas/pantalla_final.tscn"


func enter ():
	super.enter()
	animacionesGolem.play ("death")
	await animacionesGolem.animation_finished
	get_tree().change_scene_to_file(escena_final)
