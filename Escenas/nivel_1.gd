extends Node2D


var cursor_mira = load("res://Assets/cursores mouse/target_b.svg")

func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor_mira)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
