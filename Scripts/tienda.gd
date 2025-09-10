extends Node2D

@onready var sprite_press_f := $SpritePressF
@onready var inventorio_tienda: Control = $InventoryUI


func _ready() -> void:
	sprite_press_f.hide()
	inventorio_tienda.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_tienda_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		sprite_press_f.show()
		if Input.is_action_just_pressed("accion_F"):
			inventorio_tienda.show()


func _on_area_tienda_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		sprite_press_f.hide()
		inventorio_tienda.hide()
