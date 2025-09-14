extends Node2D
class_name GolemBossState
@onready var debug = %debug
@onready var animacionesGolem : AnimatedSprite2D = %AnimatedSprite2D_animacionesgolem
@onready var player = get_tree().get_first_node_in_group("jugador")
func _ready():
	set_physics_process(false)
func enter():
	set_physics_process(true)
func exit():
	set_physics_process(false)
func transition():
	
	pass
func _physics_process(delta: float) -> void:
	transition()
	debug.text = name
