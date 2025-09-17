extends Area2D
@onready var range_sprites: AnimatedSprite2D = %RangeSprites

var can_damage = false

func _on_range_sprites_frame_changed() -> void:
	if range_sprites.frame in [9, 10, 11, 12, 13, 14]:
		can_damage = true
	else:
		can_damage = false
		
func _on_body_entered(body: Node2D) -> void:
	if can_damage and body.is_in_group("jugador"):
		print ("daño laser")
		Global.hacer_daño_player.emit(1)
