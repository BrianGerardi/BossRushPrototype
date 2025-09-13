extends GolemBossState

@onready var pivot: Node2D = $"../../Pivot"
var can_transition: bool = false
@onready var range_sprites: AnimatedSprite2D = %RangeSprites

func enter ():
	super.enter()
	animacionesGolem.play("laser_cast")
	await animacionesGolem.animation_finished
	set_target()
	range_sprites.play("laser")
	await range_sprites.animation_finished
	can_transition = true
	
func set_target():
	pivot.rotation = (player.global_position - pivot.global_position).angle()

func transition():
	if can_transition:
		can_transition = false
		get_parent().change_state("Dash")
