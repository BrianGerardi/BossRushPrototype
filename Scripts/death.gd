extends GolemBossState

func enter ():
	super.enter()
	animacionesGolem.play ("death")
	await animacionesGolem.animation_finished
	
