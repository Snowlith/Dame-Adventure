extends CharacterBody2D

@export var speed = 30
@export var acceleration = 8
@export var friction = 10
var animationPlayer = null
var animationTree = null
var animationState = null

var redirect_angles = []

func _ready():
	animationPlayer = $AnimationPlayer
	animationTree = $AnimationTree
	animationState = animationTree.get("parameters/playback")
	set_collision_layer_value(z_index+1, true)
	set_collision_mask_value(z_index+1, true)
	
	set_motion_mode(MOTION_MODE_FLOATING)
	

func move_z(z_mov: int):
	# change ordering
	z_index += z_mov
	
	var old_layer = z_index+1-z_mov
	var new_layer = z_index+1
	
	# change collision layer
	set_collision_layer_value(old_layer, false)
	set_collision_mask_value(old_layer, false)
	
	set_collision_layer_value(new_layer, true)
	set_collision_mask_value(new_layer, true)


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	for angle in redirect_angles:
		input_vector = input_vector.rotated(angle)
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.lerp(input_vector * speed, acceleration * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.lerp(Vector2.ZERO, friction * delta)
	
	move_and_slide()
	
	if is_on_wall():
		# if player is colliding with a wall, project velocity onto collision normal
		var wall_normal = get_wall_normal()
		velocity = velocity - wall_normal * velocity.dot(wall_normal)
	
	#var last_collision = get_last_slide_collision()
	#if last_collision:
		#var tile_rid = last_collision.get_collider_rid()
		#var col_layer = PhysicsServer2D.body_get_collision_layer(tile_rid)
		#print(col_layer)
