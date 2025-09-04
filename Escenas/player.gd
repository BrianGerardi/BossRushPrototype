extends CharacterBody2D
@onready var animaciones: AnimatedSprite2D = $AnimatedSprite2D

@export var velocidad_de_movimiento = 100.0
var last_direction = "down"
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()

func update_animation (state):
	animaciones.play (state + "_" +last_direction)
	
func get_input ():
	var input_direction = Input.get_vector("mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")
	
	if input_direction == Vector2.ZERO:
		velocity = Vector2.ZERO
		update_animation("idle")
		return
	if abs (input_direction.x) > abs(input_direction.y):
		if input_direction.x > 0:
			last_direction = "right"
		else:
			last_direction = "left"
	else:
		if input_direction.y >0:
			last_direction = "down"
		else:
			last_direction = "up"
	update_animation("run")
	if last_direction == "right" and (Input.is_action_just_pressed("ataque")):
		animaciones.play ("attack_right")
	
	
	velocity = input_direction * velocidad_de_movimiento
	
