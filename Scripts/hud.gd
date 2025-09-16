extends Control


@onready var vida_nodo: PackedScene = preload("res://Escenas/icono_vida.tscn")
@onready var contenedor_vidas: HBoxContainer = %HBoxVidas


func _ready() -> void:
	Global.game_over.connect(_on_game_over)
	Global.aumentar_vidas.connect(_on_aumentar_vidas)
	Global.hacer_daño_player.connect(_on_hacer_daño)


func _physics_process(delta: float) -> void:
	%CantMonedas.text = str(Global.monedas_global)

func _on_game_over():
	Global.guardar_datos()
	pass

func _on_aumentar_vidas(cantidad_vidas : int):
	for vidas in range(cantidad_vidas):
		var instancia_vida = vida_nodo.instantiate()
		contenedor_vidas.add_child(instancia_vida)

func _on_hacer_daño(cantidad_de_daño: int):
	var vidas = contenedor_vidas.get_child_count()
	#otra forma es consultar si player todavia tiene vida, hay que definirlo, puntos como ahora o valores de 0 a 100
	if vidas > 0: #si hay vidas disponibles
		contenedor_vidas.get_child(vidas-1).queue_free()
	else:
		Global.game_over.emit()
