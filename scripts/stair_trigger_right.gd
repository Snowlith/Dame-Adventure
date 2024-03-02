extends Area2D

# for the sideways stair input vector distortion
	# assign a variable to the player that is removed when the player exits
var mid_x = 0
var redirect_angle = -PI/4

func _ready():
	mid_x = $"Polygon Shape".global_position.x + calculate_polygon_centroid().x
	body_entered.connect(func(body: Node2D): enter(body))
	body_exited.connect(func(body: Node2D): exit(body))

func enter(body: Node2D):
	if body.is_in_group("Player"):
		if body.position.x < mid_x:
			body.move_z(1)
		if "redirect_angles" in body:
			body.redirect_angles.append(redirect_angle)
			#print(body.redirect_angles)

func exit(body: Node2D):
	if body.is_in_group("Player"):
		if body.position.x < mid_x:
			body.move_z(-1)
		if "redirect_angles" in body:
			body.redirect_angles.erase(redirect_angle)
			#print(body.redirect_angles)
			

func calculate_polygon_centroid():
	var vertices = $"Polygon Shape".polygon
	var num_vertices = vertices.size()
	
	# Calculate the sum of x and y coordinates
	var sum_x = 0.0
	var sum_y = 0.0
	
	for vertex in vertices:
		sum_x += vertex.x
		sum_y += vertex.y
	
	# Calculate the centroid as the average of x and y coordinates
	var centroid_x = sum_x / num_vertices
	var centroid_y = sum_y / num_vertices
	
	return Vector2(centroid_x, centroid_y)
