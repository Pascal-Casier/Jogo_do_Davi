@tool
extends ColorRect

@export var new_word : String = ""
@onready var margin_container: MarginContainer = $MarginContainer/ColorRect/HBoxContainer/MarginContainer
@onready var v_box_container: VBoxContainer = $MarginContainer/ColorRect/HBoxContainer/VBoxContainer
@onready var button: Button = $MarginContainer/ColorRect/HBoxContainer/MarginContainer/Button
const CORRECT_SOUND_EFFECT = preload("res://Jogo_do_Davi/sounds/Correct sound effect.mp3")
const WRONG_SOUND_EFFECT__MP_3_CUT_NET_ = preload("res://Jogo_do_Davi/sounds/wrong sound effect (mp3cut.net).mp3")
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@onready var lblscore_2: Label = %Score2

var nome : String = ""
var image_name : String = ""

var correct_answer_score : int = 0
var wrong_answer_score : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.text = new_word
	#for c in margin_container.get_children():
		#nome = c.text
		#print_debug(nome)
	for b in v_box_container.get_children():
		b.pressed.connect(on_image_pressed.bind(b))
		


func on_image_pressed(b):
	image_name = b.text
	print_debug(nome + image_name)
	if image_name == new_word:
		print ("bravo")
		correct_answer_score += 1
		lblscore_2.text = str(wrong_answer_score , " réponses incorrecte(s)")
		b.disabled = true
		audio_stream_player.stream = CORRECT_SOUND_EFFECT
		audio_stream_player.play()
		%BtnNext.show()
		if Global.chapter_nbr > 1:
			%BtnPrevieous.show()
	else:
		print ("dommage")
		wrong_answer_score += 1
		b.disabled = true
		audio_stream_player.stream =WRONG_SOUND_EFFECT__MP_3_CUT_NET_
		audio_stream_player.play()


func _on_btn_next_pressed() -> void:
	Global.chapter_nbr += 1
	if %BtnNext.text != "fin":
		get_tree().change_scene_to_file("res://Jogo_do_Davi/game_" + str(Global.chapter_nbr) + ".tscn")
	else: 
		get_tree().quit()

func _on_btn_previeous_pressed() -> void:
	Global.chapter_nbr -= 1
	get_tree().change_scene_to_file("res://Jogo_do_Davi/game_" + str(Global.chapter_nbr) + ".tscn")
	print_debug( "previeus")
