extends Control

@export var item_1_pistola : arma_equipable
@export var item_2_uzi : arma_equipable
@export var item_3_ak47 : arma_equipable


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_panel_arma_1_mouse_entered() -> void:
	set_text_descripcion(item_1_pistola.itemdescription)


func set_text_descripcion(texto : String):
	%LabelDescripcion.text = texto


func _on_button_comprar_1_pressed() -> void:
	if Global.alcanzan_monedas_para_comprar(item_1_pistola.precio):
		Global.realizar_compra(item_1_pistola.precio)
		Global.guardar_datos()
		item_1_pistola.usar_item()
		iniciar_juego()
	else:
		%AnimationPlayerArmas.play("monedas_insuficientes")


func _on_button_comprar_3_pressed() -> void:
	if Global.alcanzan_monedas_para_comprar(item_3_ak47.precio):
		Global.realizar_compra(item_3_ak47.precio)
		Global.guardar_datos()
		item_3_ak47.usar_item()
		iniciar_juego()
	else:
		%AnimationPlayerArmas.play("monedas_insuficientes")


func iniciar_juego():
	get_tree().change_scene_to_file("res://Escenas/Nivel1.tscn")



func _on_button_comprar_2_pressed() -> void:
	if Global.alcanzan_monedas_para_comprar(item_2_uzi.precio):
		Global.realizar_compra(item_2_uzi.precio)
		Global.guardar_datos()
		item_2_uzi.usar_item()
		iniciar_juego()
	else:
		%AnimationPlayerArmas.play("monedas_insuficientes")


func _on_panel_arma_2_mouse_entered() -> void:
	set_text_descripcion(item_2_uzi.itemdescription)


func _on_panel_arma_3_mouse_entered() -> void:
	set_text_descripcion(item_3_ak47.itemdescription)
