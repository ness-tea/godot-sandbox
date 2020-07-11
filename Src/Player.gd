extends KinematicBody2D

const MAX_SPEED = 110
const ACCELERATION = 450
const FRICTION = 450

var velocity = Vector2.ZERO

# Called every frame
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	# Origin at top, left - positive directions (down, right)
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	# multiply by delta -> acceleration/max speed/friction relative to frame rate
	# pixels per frame -> pixels per second
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity) 
