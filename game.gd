@tool
extends ColorRect

@onready var margin_container: MarginContainer = $MarginContainer/ColorRect/HBoxContainer/MarginContainer
@onready var v_box_container: VBoxContainer = $MarginContainer/ColorRect/HBoxContainer/VBoxContainer

var nome : String = ""
var image_name : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for c in margin_container.get_children():
		nome = c.text
		print (nome)
	for b in v_box_container.get_children():
		b.pressed.connect(on_image_pressed.bind(b))
		


func on_image_pressed(b):
	image_name = b.text
	print (nome + image_name)
	if image_name == nome:
		print ("bravo")
	else:
		print ("dommage")
