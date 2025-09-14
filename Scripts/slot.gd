extends PanelContainer

@export var padre : Control

@export var item : items:
	set (value):
		item = value
		$Icon.texture = item.icon
		
func _on_mouse_entered() -> void:
	if item != null:
		padre.set_description (item)
