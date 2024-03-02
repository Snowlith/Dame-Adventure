extends Node

# How to apply correct YSort functionality for tilemaps:
# [The script does most of it automatically]
# 1) Make player sprite origin at the feet
# 2) In each "Layer" node, set Ordering/Z_Index to its name suffix
# 3) In each "Detail" tilemap, set Layers/Y_Sort_Origin to 16
# 4) Set Ordering/Y_Sort_Enabled to True for all nodes
	# For Tilemaps, Layers/Y_Sort_Enabled must be True as well

func handle_tilemap(tm, z):
	tm.set_layer_y_sort_enabled(0, true)
			
	# create duplicate tileset
	var new_tileset = tm.tile_set.duplicate(true)
	# why do I have to use pow?? idk
	new_tileset.set_physics_layer_collision_layer(0, pow(2, z))
	new_tileset.set_physics_layer_collision_mask(0, pow(2, z))
	new_tileset.set_physics_layer_collision_layer(1, pow(2, z+1))
	new_tileset.set_physics_layer_collision_mask(1, pow(2, z+1))
	tm.tile_set = new_tileset
	
	tm.y_sort_enabled = true
	for tile in tm.get_used_cells_by_id(0):
		var data = tm.get_cell_tile_data(0, tile)

func handle_object_layer(tm, z):
	for child in tm.get_children():
		if child is CollisionObject2D:
			# reset default layers
			child.set_collision_layer_value(1, false)
			child.set_collision_mask_value(1, false)
			
			# add custom layers
			var str_layers = child.get_meta("collision_layers", "0")
			for l in str_layers.split(','):
				l = int(l)
				child.set_collision_layer_value(l+z+1, true)
				child.set_collision_mask_value(l+z+1, true)
		if child is Sprite2D:
			print("not supposed to have these yet")

func _post_process(base_node: Node2D):
	base_node.y_sort_enabled = true
	for layer in base_node.get_children():
		layer.y_sort_enabled = true
		var z = layer.z_index
		for child in layer.get_children():
			if child is TileMap:
				handle_tilemap(child, z)
			elif child is Node2D:
				handle_object_layer(child, z)
				
	return base_node
