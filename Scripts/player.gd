extends CharacterBody2D

@export var vida : float = 100.0
@onready var animaciones: AnimatedSprite2D = $AnimatedSprite2D
@onready var escena_disparo : PackedScene = preload("res://Escenas/disparo.tscn")
@onready var arma_player: Node2D = %ArmaPlayer
@export var velocidad_caminar : float = 200.0
@export var fuerza_de_salto : float = 400
var posicion_mouse : Vector2
enum estados_player {
	IDLE,
	CORRER,
	SALTAR,
	CAER,
	DAÑO,
	DISPARAR
}
var estado_actual : estados_player = estados_player.IDLE
#var velocidad: Vector2 = Vector2.ZERO

var last_direction = "down"
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	controlar_disparos()
	manejar_input(delta)
	aplicar_gravedad(delta)
	move_and_slide()
	actualizar_estado()
	ejecutar_animaciones()
	Global.set_posicion_player(global_position)


func manejar_input(delta : float):
	var input_x = Input.get_action_strength("mover_derecha") - Input.get_action_strength("mover_izquierda")
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		Global.hacer_daño_player.emit(1)
		velocity.y = -fuerza_de_salto
		estado_actual = estados_player.SALTAR
	if estado_actual != estados_player.DAÑO:
		velocity.x = input_x * velocidad_caminar
		if velocity.x > 0:
			animaciones.flip_h = false
		elif velocity.x < 0:
			animaciones.flip_h = true
	else:
		velocity.x = 0


func ejecutar_animaciones() -> void:
	match estado_actual:
		estados_player.IDLE:
			animaciones.play("quieto")
		estados_player.CORRER:
			animaciones.play("correr")
		estados_player.SALTAR:
			animaciones.play("saltar")
		estados_player.CAER:
			animaciones.play("caer")
		estados_player.DISPARAR:
		#	animaciones.play("disparar")
			pass #todavia no la tenemos a esta animacion
		estados_player.DAÑO:
			animaciones.play("daño")

func controlar_disparos():
	posicion_mouse = get_global_mouse_position()
	arma_player.look_at(posicion_mouse)
	if Input.is_action_just_pressed("ataque"):
		#print("DISPARAR")
		var instancia_disparo : Node2D= escena_disparo.instantiate()
		instancia_disparo.rotation = arma_player.global_rotation #para que apunte correctamente, porque el disparo solo va hacia su adelante
		instancia_disparo.global_position = arma_player.global_position #lo coloco en la posicion del arma
		get_tree().current_scene.add_child(instancia_disparo) #lo agrego como hijo del nivel, no de player


func aplicar_gravedad(delta : float):
	if not is_on_floor():
		velocity += get_gravity() * delta




func actualizar_estado() -> void:
	match estado_actual:
		estados_player.IDLE:
			if not is_on_floor():
				estado_actual = estados_player.CAER
			elif abs(velocity.x) > 0.1:
				estado_actual = estados_player.CORRER
		estados_player.CORRER:
			if not is_on_floor():
				estado_actual = estados_player.CAER
			elif abs(velocity.x) < 0.1:
				estado_actual = estados_player.IDLE
		estados_player.SALTAR:
			if velocity.y > 0:
				estado_actual = estados_player.CAER
		estados_player.CAER:
			if is_on_floor():
				if abs(velocity.x) > 0.1:
					estado_actual = estados_player.CORRER
				else:
					estado_actual = estados_player.IDLE
		estados_player.DISPARAR:
			#todavia no la tenemos pero por si pinta agregar
			#igual como el arma esta separada del cuerpo lo mejor aca seria poner un animation player
			pass
		estados_player.DAÑO:
			if not animaciones.is_playing():
				if not is_on_floor():
					estado_actual = estados_player.CAER
				elif abs(velocity.x) > 0.1:
					estado_actual = estados_player.CORRER
				else:
					estado_actual = estados_player.IDLE

func recibir_daño(cantidad : float): #NOTA ESTO NO SE ESTA USANDO
	#se esta usando otro metodo, borrando las barritas de vida en el HUD, si se acaban ahi mismo se llama 
	#a la signal game over
	#perooo si decidimos cambiarlo a valores de vida, usamos esta forma
	
	#	vida -= cantidad
#	if vida <= 0:
#		print("game over")
#		Global.game_over.emit()
	pass
	

func aumentar_vida(cantidad : int):
	pass
