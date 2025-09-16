extends GolemBossState

var can_transition :bool = false

func enter (): 
	super.enter()
	animacionesGolem.play ("armor_buff")
	await animacionesGolem.animation_finished
	can_transition = true
	
func transition():
	if can_transition:
		can_transition = false
		get_parent().change_state("Follow")
