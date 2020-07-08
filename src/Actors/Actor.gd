extends KinematicBody2D      # Must extend type of the Node you're attaching this script to (in this case, the Player node is KinematicBody2D)
class_name Actor

export var speed: = Vector2(300.0, 1000.0)
export var gravity: = 3000.0	# Tells Godot that this is a decimal, not an integer
var velocity: = Vector2.ZERO

func _physics_process(delta): # Called every frame (30-60 seconds) 
	velocity.y += gravity * delta 	# delta is a value that the engine gives us every frame (time elapsed)
	velocity.y = max(velocity.y, speed.y)	# caps speed of character's velocity
	move_and_slide(velocity) 		# Moves character at a velocity
