extends Node

var volumes := {}  # Diccionario para guardar volumenes por bus

func set_volume(bus_name: String, value: float) -> void:
	volumes[bus_name] = value
	var bus_index = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

func get_volume(bus_name: String) -> float:
	if volumes.has(bus_name):
		return volumes[bus_name]
	# Si nunca se guardó, devolver el valor actual del AudioServer
	var bus_index = AudioServer.get_bus_index(bus_name)
	return db_to_linear(AudioServer.get_bus_volume_db(bus_index))
