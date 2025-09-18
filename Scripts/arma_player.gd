extends Node2D

@export var sprite_arma : Sprite2D

func _ready() -> void:
	var textura = Global.get_textura_arma()
	if textura!=null:
		set_textura_arma(textura)


func set_textura_arma(nueva_textura : Texture2D):
	print("cambiar textura arma en armaPlayer")
	sprite_arma.texture = nueva_textura


func get_centro_arma_position():
	return %Marker2DDisparaAca.global_position

func flipear_arma_true():
	%SpriteArma.flip_v = true

func flipear_arma_false():
	%SpriteArma.flip_v = false
