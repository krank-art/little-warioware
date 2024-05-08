@tool
extends Node2D
@export var sprite_path: NodePath
@onready var sprite: Sprite2D = get_node(sprite_path)

@export var tilemap_path: NodePath
@onready var tilemap: TileMap = get_node(tilemap_path)

@export var parse_sprite = false: set = do_parse_sprite


func _ready() -> void:
	pass  # Replace with function body.


func do_parse_sprite(_val: bool):
	sprite = get_node(sprite_path)
	tilemap = get_node(tilemap_path)
	var tex = sprite.texture.get_data()
	false # tex.lock() # TODOConverter3To4, Image no longer requires locking, `false` helps to not break one line if/else, so it can freely be removed
	for x in tex.get_width():
		for y in tex.get_height():
			var pix = tex.get_pixel(x, y)
			var tile_color = pix.to_html(true).to_upper()
			if !tile_color.begins_with("0"):
				tilemap.set_cell(x, y, tilemap.tile_set.find_tile_by_name(tile_color))
			else:
				tilemap.set_cell(x, y, -1)
