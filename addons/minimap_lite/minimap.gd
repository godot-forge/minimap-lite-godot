extends Node

const MAX_NODES: int = 4

signal node_clicked(node_id: String, world_pos: Vector2)

var _world_rect: Rect2 = Rect2(-500, -500, 1000, 1000)
var _map_rect: Rect2 = Rect2(10, 10, 150, 150)
var _tracked: Dictionary = {}

func setup(world_rect: Rect2, map_rect: Rect2) -> void:
	_world_rect = world_rect
	_map_rect = map_rect

func track(node_id: String, node: Node2D, color: Color = Color.WHITE, radius: float = 4.0) -> bool:
	if _tracked.size() >= MAX_NODES and not _tracked.has(node_id):
		push_warning("Minimap Lite: max %d nodes. Upgrade to PRO." % MAX_NODES)
		return false
	_tracked[node_id] = {"node": node, "color": color, "radius": radius, "label": ""}
	return true

func untrack(node_id: String) -> void:
	_tracked.erase(node_id)

func world_to_map(world_pos: Vector2) -> Vector2:
	var nx: float = (world_pos.x - _world_rect.position.x) / _world_rect.size.x
	var ny: float = (world_pos.y - _world_rect.position.y) / _world_rect.size.y
	return Vector2(
		_map_rect.position.x + nx * _map_rect.size.x,
		_map_rect.position.y + ny * _map_rect.size.y
	)

func map_to_world(map_pos: Vector2) -> Vector2:
	var nx: float = (map_pos.x - _map_rect.position.x) / _map_rect.size.x
	var ny: float = (map_pos.y - _map_rect.position.y) / _map_rect.size.y
	return Vector2(
		_world_rect.position.x + nx * _world_rect.size.x,
		_world_rect.position.y + ny * _world_rect.size.y
	)

func get_dot_positions() -> Array:
	var result: Array = []
	for id in _tracked:
		var entry: Dictionary = _tracked[id]
		if not is_instance_valid(entry["node"]):
			continue
		var node: Node2D = entry["node"]
		result.append({
			"id": id,
			"map_pos": world_to_map(node.global_position),
			"color": entry["color"],
			"radius": entry["radius"],
		})
	return result

func tracked_ids() -> Array:
	return _tracked.keys()

func is_tracked(node_id: String) -> bool:
	return _tracked.has(node_id)

func get_world_rect() -> Rect2:
	return _world_rect

func get_map_rect() -> Rect2:
	return _map_rect
