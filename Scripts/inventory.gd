extends Control
@onready var grid = $NinePatchRect/GridContainer
var ItemScene = preload("res://Escenas/item.tscn")

# Ejemplo de "objetos del jugador"
var objetos = [
	{"icono": preload("res://UIAssetsTest/png/Star/Medium/Active.png"), "nombre": "Espada", "cantidad": 1},
	{"icono": preload("res://UIAssetsTest/png/Star/Medium/Unactive.png"), "nombre": "Poción", "cantidad": 3}
]

func _ready():
	mostrar_inventario()

func mostrar_inventario():
	# Limpiar antes de rellenar
	for child in grid.get_children():
		child.queue_free()
	
	# Instanciar un Item.tscn por cada objeto
	for data in objetos:
		var item = ItemScene.instantiate()
		item.icono = data["icono"]
		item.nombre = data["nombre"]
		item.cantidad = data["cantidad"]
		grid.add_child(item)

func _on_cerrar_button_pressed():
	self.visible = false
