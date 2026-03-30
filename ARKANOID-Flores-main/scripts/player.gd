extends CharacterBody2D

const MOVE_SPEED=350

func _physics_process(_delta: float) -> void:
	velocity= Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		velocity.x= -MOVE_SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x= MOVE_SPEED
		
	move_and_slide()
	position.y = 656
