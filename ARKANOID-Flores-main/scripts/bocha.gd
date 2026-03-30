extends RigidBody2D

const VELOCIDAD = 600.0

func _ready() -> void:
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
	linear_velocity = linear_velocity.normalized() * VELOCIDAD
	if abs(linear_velocity.y) < 50:
		linear_velocity.y = 50 * sign(linear_velocity.y)
		

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$AudioStreamPlayer.playing = true
	if body.has_method("hit"):
		body.hit()
