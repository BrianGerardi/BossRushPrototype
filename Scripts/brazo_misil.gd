extends Area2D
@onready var sprite_misil: AnimatedSprite2D = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("jugador")

var acceleration: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

func _ready():
	sprite_misil.play("default") 
func _physics_process(delta: float) -> void:
	acceleration = (player.position - position).normalized () *700
	
	velocity += acceleration * delta
	rotation = velocity.angle()
	velocity = velocity.limit_length(150)
	position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		queue_free()
