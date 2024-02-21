extends Area2D

# for the sideways stair input vector distortion
	# assign a variable to the player that is removed when the player exits

func _ready():
	body_entered.connect(func(body: Node2D): enter(body))

func enter(body: Node2D):
	if body.is_in_group("Player"):
		if body.position.y > position.y:
			body.move_z(1)
