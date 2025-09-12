extends Node2D
var current_state : GolemBossState
var previous_state : GolemBossState

func _ready():
	change_state("Idle")  # arrancamos en Idle

func change_state(state_name: String):
	# Buscar el nodo hijo con ese nombre
	var new_state = get_node_or_null(state_name) as GolemBossState
	if new_state == null:
		push_warning("Estado no encontrado: " + state_name)
		return
	
	# Salir del estado actual
	if current_state:
		current_state.exit()
		previous_state = current_state
	
	# Entrar al nuevo estado
	current_state = new_state
	current_state.enter()
