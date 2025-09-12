extends Control


@onready var vida_nodo: PackedScene = preload("res://Escenas/icono_vida.tscn")
@onready var contenedor_vidas: HBoxContainer = %HBoxVidas


func _ready() -> void:
	Global.game_over.connect(_on_game_over)
	Global.aumentar_vidas.connect(_on_aumentar_vidas)


func _physics_process(delta: float) -> void:
	%CantMonedas.text = str(Global.monedas_global)

func _on_game_over():
	pass

func _on_aumentar_vidas(cantidad_vidas : int):
	for vidas in range(cantidad_vidas):
		var instancia_vida = vida_nodo.instantiate()
		contenedor_vidas.add_child(instancia_vida)
