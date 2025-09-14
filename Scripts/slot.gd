extends PanelContainer

@export var item : items:
	set (value):
		item = value
		$Icon.texture = item.icon
		
func _on_mouse_entered() -> void:
	if item != null:
		owner.set_description (item)
