extends StaticBody2D

func hit():
	$CollisionShape2D.set_deferred("disabled", true)
	get_parent().get_parent().restar_bloque()
	queue_free()
