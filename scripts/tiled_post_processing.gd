extends Node

# How to apply correct YSort functionality for tilemaps:
# 1) Make player sprite origin at the feet
# 2) In each "Layer" node, set Ordering/Z_Index to its name suffix
# 3) In each "Detail" tilemap, set Layers/Y_Sort_Origin to 16
# 4) Set Ordering/Y_Sort_Enabled to True for all nodes
	# For Tilemaps, Layers/Y_Sort_Enabled must be True as well

func example(base_node: Node2D):
	var area = base_node.find_child("Area2")
	var mat = CanvasItemMaterial.new()
	mat.blend_mode = CanvasItemMaterial.BLEND_MODE_MUL
	area.material = mat
	return base_node

func _post_process(base_node: Node2D):
	for layer in base_node.get_children():
		for child in layer.get_children():
			if not child is TileMap:
				continue
			for tile in child.get_used_cells_by_id(0):
				pass
	return base_node
