extends Button

@export var my_icon : Texture2D

func _ready() -> void:
	$TextureRect.texture = my_icon
