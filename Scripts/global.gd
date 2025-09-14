extends Node

signal game_over #se emite en player, se recibe en hud + los que necesitemos
signal aumentar_vidas(cantidad_vidas : int)
signal hacer_daño(cantidad_daño : int)
var posicion_player : Vector2
var monedas_global : int = 0


func _ready() -> void:
	cargar_datos() #para guardar las monedas en memoria, más adelante si llegamos meter los items comprados


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func get_posicion_player():
	return posicion_player

func set_posicion_player(posicion_ref : Vector2):
	posicion_player = posicion_ref


func cargar_datos():
	var config = ConfigFile.new()
	if config.load("user://datos_guardados_bossrush.cfg") == OK:
		monedas_global = config.get_value("datos_jugador", "monedas_global", 0)
	else:
		print("No se encontro un archivo para cargar")

func guardar_datos():
	var config = ConfigFile.new()
	config.set_value("datos_jugador", "monedas_global", monedas_global)
	config.save("user://datos_guardados_bossrush.cfg")
	#crea un archivo en appdata y guarda todo ahi

func sumar_monedas(cantidad_monedas: int):
	monedas_global += cantidad_monedas
