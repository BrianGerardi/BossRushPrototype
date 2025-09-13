extends CharacterBody2D
@onready var player = get_tree().get_first_node_in_group("jugador")
@onready var sprites: AnimatedSprite2D = %AnimatedSprite2D_animacionesgolem

var direction : Vector2
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
