extends CharacterBody2D
@onready var animaciones: AnimatedSprite2D = $AnimatedSprite2D
@onready var escena_disparo : PackedScene = preload("res://Escenas/disparo.tscn")
var posicion_mouse : Vector2
@export var velocidad_de_movimiento = 100.0
@onready var arma_player: Node2D = %ArmaPlayer

var last_direction = "down"
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	posicion_mouse = get_global_mouse_position()
	arma_player.look_at(posicion_mouse)
	if Input.is_action_just_pressed("ataque"):
		var direccion = (posicion_mouse-position).normalized()
		print("DISPARAR")
		var instancia_disparo : Node2D= escena_disparo.instantiate()
		instancia_disparo.rotation = arma_player.global_rotation #para que apunte correctamente, porque el disparo solo va hacia su adelante
		instancia_disparo.global_position = arma_player.global_position #lo coloco en la posicion del arma
		get_tree().current_scene.add_child(instancia_disparo)
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
	
