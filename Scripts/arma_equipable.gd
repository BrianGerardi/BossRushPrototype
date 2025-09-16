extends items
class_name arma_equipable


@export var cooldown_disparar : float = 0.3
@export var sprite_disparo : Texture2D


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func usar_item():
	Global.player_set_cooldown_disparo.emit(cooldown_disparar)
	Global.cambiar_sprite_disparo.emit(sprite_disparo)
	Global.cambiar_sprite_arma.emit(icon)
