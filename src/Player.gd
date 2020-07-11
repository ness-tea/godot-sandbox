extends KinematicBody2D

var velocity = Vector2.ZERO

# Called every frame
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	# Origin at top, left - positive directions (down, right)
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO
	
	move_and_collide(velocity)
