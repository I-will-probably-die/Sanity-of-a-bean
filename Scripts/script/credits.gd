extends Control

@onready var trans: AnimationPlayer = $Transition
@onready var death_note: Label = $"Death note"
@onready var alive_note: Label = $"Alive note"
@onready var click: AudioStreamPlayer = $Click

func _on_back_pressed() -> void:
	click.pitch_scale = randf_range(0.8, 1)
	click.play()
	trans.play("Fadein")
	Autoload.passive_Fin = false
	Autoload.nice_Fin = false
	Autoload.perstist_Fin = false

func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fadein":
		get_tree().change_scene_to_file("res://scene/main_menu.tscn")

func _ready() -> void:
	trans.play("FadeOutLong")
	if Autoload.died == true:
		death_note.visible = true
		alive_note.visible = false
	if Autoload.alive == true:
		alive_note.visible = true
		death_note.visible = false
