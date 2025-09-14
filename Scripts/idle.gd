extends GolemBossState
@onready var player_detection: Area2D = $"../../PlayerDetection"
@onready var collision: CollisionShape2D = $"../../PlayerDetection/CollisionShape2D"
@onready var progress_bar: ProgressBar = $"../../UI/ProgressBar"


var entro_el_player: bool = false: 
	set(value):
		entro_el_player = value
		collision.set_deferred("disabled", value)
		progress_bar.set_deferred("visible", value)
#es una variable que se modifica cuando el player entra en el area de detect,
#busca los valores con el set_deferred y les pasa en este caso, q deje de querer detectarlo, y se 
#vea la barra de vida
func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		entro_el_player = true
		
func transition():
	if entro_el_player:
		get_parent().change_state("Follow")
