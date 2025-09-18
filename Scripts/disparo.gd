extends Node2D

@export var sprite_disparo : Sprite2D
var direccion_disparo : Vector2
@export var velocidad_de_disparo : float = 200.0
var daño = 1

func _ready() -> void:
	var textura = Global.get_textura_disparo()
	daño = Global.get_daño_disparo()
	if textura!=null:
		set_textura_disparo(textura)



func _physics_process(delta: float) -> void:
	position+= transform.x * velocidad_de_disparo * delta


func set_direccion_disparo(posicion_mouse : Vector2):
	direccion_disparo = posicion_mouse

func set_textura_disparo(textura_disparo):
	sprite_disparo.texture = textura_disparo

func set_velocidad_de_disparo(velocidad : float):
	velocidad_de_disparo = velocidad



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#si sale de la pantalla, se elimina
	queue_free()
#	print("eliminar disparo")


func _on_area_2d_disparo_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemigo"):
		print ("hacer daño disparo en disparo")
		if body.has_method("hacer_daño_boss"): #si nos olvidamos de poner la funcion hacer_daño() en el enemigo con esto no va a tirar error
			body.hacer_daño_boss(daño)
			queue_free()
