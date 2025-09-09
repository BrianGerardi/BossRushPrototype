extends Control

@export var description : NinePatchRect

func set_description(item : Item):
	description.get_node("Name").text = item.name
	description.get_node("Icon").texture = item.icon
	description.get_node("ItemDescription").text = item.itemdescription
func _ready():
	pass
