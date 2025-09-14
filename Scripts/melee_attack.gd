extends GolemBossState
func enter():
	super.enter()
	animacionesGolem.play("mele_attack")
	
func transition():
	if owner.direction.length() > 30:
		get_parent().change_state("Follow")
