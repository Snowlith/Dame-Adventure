extends Area2D

# this script is assigned to stairs that go to the right
# nodes with tag "player" change z layer when in area
	
@onready var rect = $"Rectangle Shape"

var min_x = 0
var max_x = 0

var entered_nodes = []

func _ready():
	var size = rect.shape.size
	min_x = rect.global_position.x - size.x / 2
	max_x = min_x + size.x
	
	# signals
	body_entered.connect(func(body: Node2D): enter(body))
	body_exited.connect(func(body: Node2D): exit(body))

func enter(body: Node2D):
	if body.is_in_group("Player"):
		if body.position.x < min_x:
			body.move_z(1)
		entered_nodes.append(body)

func exit(body: Node2D):
	if body.is_in_group("Player"):
		if body.position.x < min_x:
			body.move_z(-1)
		entered_nodes.erase(body)


func _process(delta):
	for body in entered_nodes:
		var t_range = max_x - min_x
		var t = clamp((body.position.x - min_x) / t_range, 0, 1)
		body.set_z_scalar(t)
