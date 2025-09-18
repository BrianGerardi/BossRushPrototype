extends Control


@onready var vida_nodo: PackedScene = preload("res://Escenas/icono_vida.tscn")
@onready var contenedor_vidas: HBoxContainer = %HBoxVidas


func _ready() -> void:
	%LabelGameOver.hide()
	Global.game_over.connect(_on_game_over)
	Global.aumentar_vidas.connect(_on_aumentar_vidas)
	Global.hacer_daño_player.connect(_on_hacer_daño)


func _physics_process(delta: float) -> void:
	%CantMonedas.text = str(Global.monedas_global)

func _on_game_over():
	Global.guardar_datos()
	%LabelGameOver.show()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://Escenas/elegir_arma.tscn")


func _on_aumentar_vidas(cantidad_vidas : int):
	for vidas in range(cantidad_vidas):
		var instancia_vida = vida_nodo.instantiate()
		contenedor_vidas.add_child(instancia_vida)
	%UsarPocion.play()

func _on_hacer_daño(cantidad_de_daño: int):
	var vidas = contenedor_vidas.get_child_count()
	#otra forma es consultar si player todavia tiene vida, hay que definirlo, puntos como ahora o valores de 0 a 100
	if vidas >= 2: #si hay vidas disponibles
		contenedor_vidas.get_child(vidas-1).queue_free()
		%AudioQuitarVida.play()
	else:
		%HBoxVidas.hide() #aca ya quita la ultima vida
		Global.game_over.emit()
