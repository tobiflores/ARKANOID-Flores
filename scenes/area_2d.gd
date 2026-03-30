extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bocha"):
		get_tree().paused = true
		$"../CanvasLayer".visible = true
