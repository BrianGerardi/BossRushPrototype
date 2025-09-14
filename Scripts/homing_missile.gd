extends GolemBossState

@export var projectil : PackedScene
var can_transition : bool = false

func enter():
	super.enter()
	animacionesGolem.play("ranged_attack")
	await animacionesGolem.animation_finished
	shoot()
	can_transition = true

func shoot():
	var disparo = projectil.instantiate()
	disparo.position = owner.position
	owner.get_parent().add_child(disparo)
	print("Disparo creado en: ", disparo.position)

func transition():
	if can_transition:
		can_transition = false
		get_parent().change_state("Dash")
