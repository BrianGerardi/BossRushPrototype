extends Node2D

@onready var sprite_press_f := $SpritePressF
@onready var inventorio_tienda: Control = %InventoryUI
var player_cerca : bool = false

func _ready() -> void:
	sprite_press_f.hide()
	inventorio_tienda.hide()


func _physics_process(delta: float) -> void:
	if player_cerca:
		if Input.is_action_just_pressed("accion_F"):
			print("mostrar tienda")
			inventorio_tienda.show()
	if Input.is_action_just_pressed("escape_salir"):
		print("esconder tienda")
		inventorio_tienda.hide()

func _on_area_tienda_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		sprite_press_f.show()
		player_cerca = true


func _on_area_tienda_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		sprite_press_f.hide()
		player_cerca = true
