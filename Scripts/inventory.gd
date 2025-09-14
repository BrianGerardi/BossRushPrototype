extends Control

@export var description : NinePatchRect

func set_description(item : items):
	description.get_node("Name").text = item.name
	description.get_node("Icon").texture = item.icon
	description.get_node("ItemDescription").text = item.itemdescription
#	description.get_node("LabelPrecio").text = str(item.precio)
func _ready():
	pass
