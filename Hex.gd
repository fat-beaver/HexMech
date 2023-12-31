extends Resource
class_name Hex

var coords: Vector2
var passable: bool: get = is_passable
var transparent: bool: get = is_transparent
var terrain_type : int: get = get_terrain_type, set = set_terrain_type
var critter : get = get_critter, set = set_critter
enum {GRASS, WATER, SAND, POLE}

#constants for hex size, cannot get these from tilemap because the size used for scaling is not the actual size
const hex_width = 192
const hex_height = 128
const graphical_hex_size = Vector2(192, 94)

func _init(new_coords: Vector2, new_terrain_type: int):
	coords = new_coords
	set_terrain_type(new_terrain_type)

func get_coords() -> Vector2:
	return coords

func get_offset_coords() -> Vector2:
	var x = coords.x + (coords.y - (coords.y as int&1)) / 2
	var y = coords.y
	return Vector2(x, y)
	
func set_terrain_type(new_terrain_type: int):
	terrain_type = new_terrain_type
	passable = true
	transparent = true
	match terrain_type:
		GRASS:
			pass
		WATER:
			passable = false
		SAND:
			pass
		POLE:
			passable = false
			transparent = false

func get_terrain_type():
	return terrain_type

func get_movement_cost():
	var movement_cost = 0
	if terrain_type == 0:
		movement_cost = 6
	elif terrain_type == 2:
		movement_cost = 12
	return movement_cost

func is_passable():
	if critter == null:
		return passable
	else:
		return false

func is_transparent():
	return transparent

func get_centre_point() -> Vector2:
	return Hex.centre_point_of_coords(coords)

static func centre_point_of_coords(hex_coords: Vector2) -> Vector2:
	var point: Vector2 = Vector2()
	point.x = 192 * hex_coords.x + 96 * hex_coords.y + hex_width / 2.0
	point.y = 0 * hex_coords.x + 94 * hex_coords.y  + hex_height / 2.0
	return point

func set_critter(new_critter):
	critter = new_critter

func get_critter():
	return critter
