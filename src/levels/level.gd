extends Node2D

var tile_size = globals.tile_size

func _ready():
	pass

func calculate_bounds():
	var used_cells = get_node("tile_front").get_used_cells()
	var min_x = 0
	var min_y = 0
	var max_x = 1
	var max_y = 1

	for pos in used_cells:
		if pos.x < min_x:
			min_x = int(pos.x)
		elif pos.x > max_x:
			max_x = int(pos.x)
		if pos.y < min_y:
			min_y = int(pos.y)
		elif pos.y > max_y:
			max_y = int(pos.y)

	return {
		"min": Vector2(
			min_x * tile_size.x + self.position.x, 
			min_y * tile_size.y + self.position.y
		),
		"max": Vector2(
			(max_x + 1) * tile_size.x + self.position.x,
			(max_y + 1) * tile_size.y + self.position.y
		),
		"height": (max_y + 1 - min_y) * tile_size.y,
		"width": (max_x + 1 - min_x) * tile_size.x
	}