extends Area2D


var mid_y = 0
var redirect_angle = 0

func _ready():
	mid_y = $"Rectangle Shape".global_position.y
	#print(mid_pos)
	body_entered.connect(func(body: Node2D): enter(body))
	body_exited.connect(func(body: Node2D): exit(body))

func enter(body: Node2D):
	if body.is_in_group("Player"):
		if body.position.y > mid_y:
			body.move_z(1)
		if "redirect_angles" in body:
			body.redirect_angles.append(redirect_angle)

func exit(body: Node2D):
	if body.is_in_group("Player"):
		if body.position.y > mid_y:
			body.move_z(-1)
		if "redirect_angles" in body:
			body.redirect_angles.erase(redirect_angle)
