extends Control


@export var next_area: String = ""
@onready var trans: AnimationPlayer = $Transition

func _ready() -> void:
	trans.play("Splash")

func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fadein":
		print("it worked")
		get_tree().change_scene_to_file(next_area)


func _on_quit_pressed() -> void:
	get_tree().quit()
