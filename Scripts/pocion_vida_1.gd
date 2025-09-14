extends items
class_name pocion_de_vida

@export var vida_extra : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func usar_item(player):
	player.aumentar_vida(vida_extra)
	#probando
