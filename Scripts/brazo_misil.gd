extends Area2D
@onready var sprite_misil: AnimatedSprite2D = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("jugador")
@onready var tiempo_de_vuelo_timer: Timer = $TiempoDeVueloTimer

var acceleration: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

@export var lifetime_seconds: float = 3.0

func _ready():
	sprite_misil.play("default") 
	tiempo_de_vuelo_timer.wait_time = lifetime_seconds
	tiempo_de_vuelo_timer.one_shot = true
	tiempo_de_vuelo_timer.start()
	
func _physics_process(delta: float) -> void:
	acceleration = (player.position - position).normalized () *700
	
	velocity += acceleration * delta
	rotation = velocity.angle()
	velocity = velocity.limit_length(100)
	position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		Global.hacer_daño_player.emit(1)
		queue_free()


func _on_tiempo_de_vuelo_timer_timeout() -> void:
	queue_free()
