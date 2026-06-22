@tool
extends EditorPlugin

func _enter_tree() -> void:
	add_autoload_singleton("Minimap", "res://addons/minimap_lite/minimap.gd")

func _exit_tree() -> void:
	remove_autoload_singleton("Minimap")
