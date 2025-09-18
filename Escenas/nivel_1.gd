extends Node2D


var cursor_mira = load("res://Assets/cursores mouse/target_b.svg")

func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor_mira)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_audio_pelea_finished() -> void:
	$AudioPelea.play() #no es la mejor forma de hacerlo loopable pero tengo sueño
	#el audio no me tiraba la opcion y el convertor online no quiso andar
