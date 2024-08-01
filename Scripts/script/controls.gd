extends Control

@onready var trans: AnimationPlayer = $Transition
@onready var click: AudioStreamPlayer = $Click


func _on_button_pressed() -> void:
	click.pitch_scale = randf_range(0.8, 1)
	click.play()
	Autoload.start = true
	trans.play("Fadein")

func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fadein":
		get_tree().change_scene_to_file("res://scene/Neutral_first.tscn")
