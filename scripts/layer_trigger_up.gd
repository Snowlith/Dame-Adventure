extends Area2D


# for correct z updating:
# in ready, find min and max y polygon points
# when enters, add to list
# when exits, remove
# every frame, compare player pos to min and max, interpolating a z value
# assign to player

# another issue, using z indices is bad because 2 high cliff is in front of player
# solve with sorting offsets somehow

@onready var rect = $"Rectangle Shape"

var min_y = 0
var max_y = 0

var entered_nodes = []

func _ready():
	var size = rect.shape.size
	min_y = rect.global_position.y - size.y / 2
	max_y = min_y + size.y
	body_entered.connect(func(body: Node2D): enter(body))
	body_exited.connect(func(body: Node2D): exit(body))

func enter(body: Node2D):
	if body.is_in_group("Player"):
		if body.position.y > min_y:
			body.move_z(1)
		entered_nodes.append(body)

func exit(body: Node2D):
	if body.is_in_group("Player"):
		if body.position.y > min_y:
			body.move_z(-1)
		entered_nodes.erase(body)


func _process(delta):
	for body in entered_nodes:
		var t_range = max_y - min_y
		var t = 1 - clamp((body.position.y - min_y) / t_range, 0, 1)
		body.set_z_scalar(t)
