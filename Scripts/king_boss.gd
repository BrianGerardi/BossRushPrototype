extends CharacterBody2D
@onready var player = get_tree().get_first_node_in_group("jugador")
@onready var sprites: AnimatedSprite2D = %AnimatedSprite2D_animacionesgolem
@onready var progress_bar: ProgressBar = %ProgressBar

var direction : Vector2
var DEF = 0 
var boss_health = 100:
	set (value):
		boss_health = value 
		ProgressBar.value = value
		if value <= 0:
			ProgressBar.visible = false
			find_child("FiniteStateMachine").change_state("Death")
		elif value <= ProgressBar.max_value / 2 and DEF == 0:
			DEF = 5
			find_child("FiniteStateMachine").change_state("ArmorBuff")


func _ready() -> void:
	set_physics_process(false)

func _process(delta: float) -> void:
	direction = player.position - position
	
	if direction.x <0:
		sprites.flip_h = true
	else:
		sprites.flip_h = false

func _physics_process(delta: float) -> void:
	velocity = direction.normalized() * 40
	move_and_collide(velocity * delta)
func hacer_daño_boss (daño : int):
	boss_health -= daño - DEF
	Global.sumar_monedad(1)
	#llamar a sumar monedas
