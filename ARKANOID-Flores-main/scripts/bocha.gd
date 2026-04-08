extends RigidBody2D

const VELOCIDAD = 600.0

func _ready() -> void:
	#CORRECCION Esta parte del código limita las funciones más interesantes del rigidbody,
	# con lo cual se podría haber usado otro objeto. No es un problema, pero es un detalle
	# que no me gusta porque es copy paste y te priva de probar
	gravity_scale = 0
	linear_damp = 0.0
	angular_damp = 0.0
	linear_velocity = Vector2(VELOCIDAD * randf_range(-1, 1), -VELOCIDAD)
	contact_monitor = true
	max_contacts_reported = 4
	
	var physics_material = PhysicsMaterial.new()
	physics_material.bounce = 1.0
	physics_material.friction = 0.0
	physics_material_override = physics_material

func _physics_process(_delta: float) -> void:
	#CORRECCION Setear frame a frame la velocidad de un rigidbody no es lo recomendado
	# si hacés Ctrl+Click sobre la propiedad podés leer la documentación donde lo dice.
	# Además elimina cualquier reacción física, por lo tanto deja obsoletas la mayoría
	# de las funciones del rigidbody
	linear_velocity = linear_velocity.normalized() * VELOCIDAD
	if abs(linear_velocity.y) < 50:
		linear_velocity.y = 50 * sign(linear_velocity.y)
		

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	#CORRECCIÓN Esto no es tan relevante pero usar esta señal es una exageración, fijate
	# que de todos los parámetros solo usas body. Mejor se usa body_entered para estos casos
	$AudioStreamPlayer.playing = true
	if body.has_method("hit"):
		body.hit()
