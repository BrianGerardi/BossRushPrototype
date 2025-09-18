extends CharacterBody2D

@export var vida : float = 100.0
@onready var animaciones: AnimatedSprite2D = $AnimatedSprite2D
@onready var escena_disparo : PackedScene = preload("res://Escenas/disparo.tscn")
@onready var arma_player: Node2D = %ArmaPlayer
@export var velocidad_caminar : float = 200.0
@onready var timer_disparar: Timer = %TimerDisparar
@export var fuerza_de_salto : float = 400
@export var cooldown_disparo : float = 0.7
var posicion_mouse : Vector2
enum estados_player {
	IDLE,
	CORRER,
	DAÑO,
	DISPARAR
}
var estado_actual : estados_player = estados_player.IDLE
#var velocidad: Vector2 = Vector2.ZERO
var last_direction = "down"

func _ready() -> void:
	cooldown_disparo = Global.get_cadencia_disparo()
	Global.player_set_cooldown_disparo.connect(set_cooldown_disparo)
	timer_disparar.wait_time = cooldown_disparo

func _physics_process(delta: float) -> void:
	controlar_disparos()
	manejar_input(delta)
	move_and_slide()
	ejecutar_animaciones()
	Global.set_posicion_player(global_position)


func manejar_input(delta : float):
	var input_direction = Input.get_vector("mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")
	
	if input_direction == Vector2.ZERO:
		velocity = Vector2.ZERO
		estado_actual= estados_player.IDLE
	else:
		velocity = input_direction * velocidad_caminar
		estado_actual = estados_player.CORRER
		ejecutar_sonido_pasos()
		if abs (input_direction.x) > abs(input_direction.y):
			if input_direction.x > 0:
				last_direction = "right"
				animaciones.flip_h = false
			else:
				last_direction = "left"
				animaciones.flip_h = true
		else:
			if input_direction.y >0:
				last_direction = "down"
			else:
				last_direction = "up"


func ejecutar_animaciones() -> void:
	match estado_actual:
		estados_player.IDLE:
			if last_direction == "up":
				animaciones.play("idle_arriba_curso")
			elif last_direction == "down":
				animaciones.play("idle_abajo_curso")
			else:
				animaciones.play("idle_curso")
		estados_player.CORRER:
			if last_direction == "up":
				animaciones.play("arriba_curso")
			if last_direction == "down":
				animaciones.play("abajo_curso")
			if last_direction == "right" or last_direction == "left":
				animaciones.play("correr_curso")
		estados_player.DISPARAR:
		#	animaciones.play("disparar")
			pass #todavia no la tenemos a esta animacion
		estados_player.DAÑO:
			pass

func controlar_disparos():
	posicion_mouse = get_global_mouse_position()
	arma_player.look_at(posicion_mouse)
	if posicion_mouse.x < global_position.x: #osea que esta apuntando para la izquierda del player
		arma_player.flipear_arma_true()
	else:
		arma_player.flipear_arma_false()
	if Input.is_action_just_pressed("ataque"):
		#print("DISPARAR")
		intentar_disparar()


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

func set_cooldown_disparo(tiempo_cooldown : float): #escucha la señal de global
	#y la señal se emite cuando se compra un arma
	cooldown_disparo = tiempo_cooldown


func intentar_disparar():
	if not timer_disparar.is_stopped():
		return #no disparar
	else:
		disparar()
		timer_disparar.start()


func disparar():
	var instancia_disparo : Node2D= escena_disparo.instantiate()
	instancia_disparo.rotation = arma_player.global_rotation #para que apunte correctamente, porque el disparo solo va hacia su adelante
	instancia_disparo.global_position = arma_player.get_centro_arma_position() #lo coloco en la posicion del arma
	get_tree().current_scene.add_child(instancia_disparo) #lo agrego como hijo del nivel, no de player
	%AudioDisparo.play()


func ejecutar_sonido_pasos():
	%AudioPasos.play()
