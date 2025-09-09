extends Control

@export var icono: Texture
@export var nombre: String = "Item"
@export var cantidad: int = 1

@onready var icono_sprite = $TextureRect2/TextureRect
@onready var nombre_label = $TextureRect2/Label

func _ready():
	icono_sprite.texture = icono
	nombre_label.text = nombre
