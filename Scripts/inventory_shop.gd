extends Control

@export var description : NinePatchRect
var selected_item : items = null
func set_description(item : items):
	selected_item = item
	description.get_node("Name").text = item.name
#	description.get_node("Icon").texture = item.icon
	description.get_node("ItemDescription").text = item.itemdescription
	description.get_node("LabelPrecio").text = str(item.precio)
func _ready():
	pass


func _on_button_comprar_pressed() -> void:
	if selected_item!= null:
		selected_item.usar_item()
