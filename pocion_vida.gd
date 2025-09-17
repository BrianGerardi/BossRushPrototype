extends Node2D


@export var vida_extra: int = 3

func _ready() -> void:
	%AnimationPocion.play("idle_pocion")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_pocion_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		Global.aumentar_vidas.emit(vida_extra)
		%UsarPocion.play()
		hide()
		await get_tree().create_timer(2).timeout
		queue_free()
