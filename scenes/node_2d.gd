extends Node2D

var bloques = 0

func _ready() -> void:
	bloques = get_tree().get_nodes_in_group("bloques").size()

func restar_bloque() -> void:
	bloques -= 1
	if bloques <= 0:
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
