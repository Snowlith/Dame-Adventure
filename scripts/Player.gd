extends CharacterBody2D

@export var speed = 30
@export var acceleration = 8
@export var friction = 10

func _ready():
	# holy shit this took 10 years to fucking find
	# i was going to give up and kms until i sucked it up and finally read the documentation
	# this thing fixes fucking everything
	pass


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.lerp(input_vector * speed, acceleration * delta)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction * delta)
	
	move_and_slide()
	
	if is_on_wall():
		# if player is colliding with a wall, project velocity onto collision normal
		var wall_normal = get_wall_normal()
		velocity = velocity - wall_normal * velocity.dot(wall_normal)
	


func _on_area_2d_body_entered(body):
	print(body)
