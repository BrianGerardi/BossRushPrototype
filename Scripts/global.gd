extends Node

signal game_over #se emite en player, se recibe en hud + los que necesitemos
signal aumentar_vidas(cantidad_vidas : int)
signal hacer_daño_player(cantidad_daño : int)
var posicion_player : Vector2
var monedas_global : int = 0
signal player_set_cooldown_disparo(tiempo_de_cooldown : float)
signal cambiar_sprite_disparo(sprite_nuevo : Texture2D)
signal cambiar_sprite_arma(sprite_nuevo : Texture2D)
var textura_disparo = null


func _ready() -> void:
	cambiar_sprite_disparo.connect(_on_cambiar_sprite_disparo)
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


func _on_cambiar_sprite_disparo(textura_nueva):
	textura_disparo = textura_nueva

func get_textura_disparo():
	return textura_disparo


func alcanzan_monedas_para_comprar(precio_producto):
	if monedas_global>=precio_producto:
		return true
	else:
		return false


func realizar_compra(precio_producto):
	monedas_global-= precio_producto
