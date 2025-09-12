extends Node2D

@export var sprite_arma : Sprite2D

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_textura_arma(nueva_textura):
	sprite_arma.texture = nueva_textura
