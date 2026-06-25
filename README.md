# Minimap Lite — Godot 4

Free 2D minimap autoload for Godot 4. Turn any Node2D positions into a minimap overlay. Lite tracks up to 4 nodes.

## Features (Lite — Free)

- `setup(world_rect, map_rect)` — define world ↔ map mapping
- `track(node_id, node, color, radius)` / `untrack(node_id)`
- `world_to_map(pos)` / `map_to_world(pos)`
- `get_dot_positions()` — draw dots in your CanvasLayer
- `tracked_ids()` / `is_tracked(id)`
- Signal: `node_clicked(node_id, world_pos)` · up to 4 nodes

## Quick Start

```gdscript
# Add addons/minimap_lite/minimap.gd as autoload named "Minimap"
Minimap.setup(Rect2(-500,-500,1000,1000), Rect2(10,10,150,150))
Minimap.track("player", $Player, Color.YELLOW, 6.0)
# In _process: draw Minimap.get_dot_positions()
```

## Upgrade to PRO

[Minimap PRO](https://godot-forge.itch.io/minimap-pro-godot) adds unlimited nodes, fog of war, named zones, custom icons, click-to-navigate and save/load.

---
Made with ♥ by [GodotForge](https://itch.io/profile/godot-forge)
