extends Node2D
class_name GolemBossState
@onready var area_deteccion : Area2D = %PlayerDetection
@onready var debug = %debug
@onready var area_de_daño_mele : Area2D = %"Area2D_DañoMele"
#@onready var player: CharacterBody2D = $"."
@onready var animacionesGolem : AnimatedSprite2D = %AnimatedSprite2D_animacionesgolem
@onready var animacionesGolemRange : AnimatedSprite2D = %RangeSprites
func _ready():
	set_physics_process(false)
	area_de_daño_mele.monitoring = false
func enter():
	set_physics_process(true)
func exit():
	set_physics_process(false)
func transition():
	
	pass
func _physics_process(delta: float) -> void:
	transition()
	debug.text = name


func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		animacionesGolem.play("mele_attack")
		#if animacionesGolem.animation_finished:
			#area_de_daño_mele.monitoring = true
			#debug.text = "pegue al player"
		
		


func _on_animated_sprite_2d_animacionesgolem_frame_changed() -> void:
	if animacionesGolem.animation == "mele_attack":
		if animacionesGolem.frame == 6: # frame exacto donde pega
			area_de_daño_mele.monitoring = true
			print("se crea el area")
		elif animacionesGolem.frame == 7: # cuando ya pasó el golpe
			area_de_daño_mele.monitoring = false
			print("se borra el area")
	if animacionesGolem.animation == "laser_cast":
		if animacionesGolem.animation_finished:
			animacionesGolemRange.play("laser")
			if animacionesGolemRange.animation_finished:
				return


func _on_area_2d_daño_mele_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		#area_de_daño_mele.monitoring = true
		print("le pegue")
		debug.text = "pegue al player"


func _on_player_detection_medium_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		animacionesGolem.play("laser_cast")
		
