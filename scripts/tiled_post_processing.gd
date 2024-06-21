extends Node

# How to apply correct YSort functionality for tilemaps:
# [The script does most of it automatically]
# 1) Make player sprite origin at the feet
# 2) In each "Layer" node, set Ordering/Z_Index to its name suffix
# 3) In each "Detail" tilemap, set Layers/Y_Sort_Origin to 16
# 4) Set Ordering/Y_Sort_Enabled to True for all nodes
	# For Tilemaps, Layers/Y_Sort_Enabled must be True as well

func handle_tilemap(tm: TileMap, z: int):
	tm.set_layer_y_sort_enabled(0, true)
	
	# this
			
	# create duplicate tileset
	var new_ts: TileSet = tm.tile_set.duplicate(true)
	# why do I have to use pow?? idk
	new_ts.set_physics_layer_collision_layer(0, pow(2, z))
	new_ts.set_physics_layer_collision_mask(0, pow(2, z))
	new_ts.set_physics_layer_collision_layer(1, pow(2, z+1))
	new_ts.set_physics_layer_collision_mask(1, pow(2, z+1))
	#print(new_tileset)
	
	var physics_layers_count = new_ts.get_physics_layers_count()
	
	# flatten physics shapes for consistent z axis
	for source_index in range(new_ts.get_source_count()):
		# get tileset source
		var source: TileSetAtlasSource = new_ts.get_source(new_ts.get_source_id(source_index))
		# loop over tiles
		for tile_index in range(source.get_tiles_count()):
			# get tile data
			var data = source.get_tile_data(source.get_tile_id(tile_index), 0)
			# fix colliders
			for physics_layer in range(physics_layers_count):
				for poly_index in range(data.get_collision_polygons_count(physics_layer)):
					var col = data.get_collision_polygon_points(physics_layer, poly_index)
					# offset colliders by z
					for l in range(col.size()):
						col[l].y += (z + physics_layer) * 16
					data.set_collision_polygon_points(physics_layer, poly_index, col)
				
			
	tm.tile_set = new_ts
	
	tm.y_sort_enabled = true
	#for tile in tm.get_used_cells_by_id(0):
		#var data = tm.get_cell_tile_data(0, tile)
		#
		#for i in range(data.get_collision_polygons_count(0)):
			#print(data.get_collision_polygon_points(z, i))
		#
		#if arbitrary_index == 1:
			#for i in range(data.get_collision_polygons_count(0)):
				#var col = data.get_collision_polygon_points(z, i)
				#print(col)
				#for j in range(col.size()):
					#col[j].y += 100
				#data.set_collision_polygon_points(z, i, col)
				#print(col)
			#data.modulate = Color(0.5, 0.5, 1, 1)
		
		# this implementation is possible
		# edit tile data through tileset instead of tm

func handle_object_layer(tm: Node2D, z: int):
	for child in tm.get_children():
		if child is CollisionObject2D:
			# reset default collision layers
			child.position.y += z * 16
			child.set_collision_layer_value(1, false)
			child.set_collision_mask_value(1, false)
			
			# add custom collision layers
			var str_layers = child.get_meta("collision_layers", "0")
			for l in str_layers.split(','):
				child.set_collision_layer_value(int(l)+z+1, true)
				child.set_collision_mask_value(int(l)+z+1, true)
		if child is Sprite2D:
			print("not supposed to have these yet")

func _post_process(base_node: Node2D):
	base_node.y_sort_enabled = true
	for layer in base_node.get_children():
		layer.y_sort_enabled = true
		var z = layer.z_index
		#layer.z_index = 0
		for child in layer.get_children():
			if child is TileMap:
				handle_tilemap(child, z)
			elif child is Node2D:
				handle_object_layer(child, z)
				
	return base_node
