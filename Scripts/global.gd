extends Node


var posicion_player
var monedas_global : int = 0

func _ready() -> void:
	cargar_datos() #para guardar las monedas en memoria, más adelante si llegamos meter los items comprados


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func get_posicion_player():
	return posicion_player

func set_posicion_player():
	pass


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
