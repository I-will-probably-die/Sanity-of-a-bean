extends Control

@onready var insane_hover: AnimationPlayer = $Insane/Insane_hover
@onready var sane_hover: AnimationPlayer = $Sane/sane_hover
@onready var trans: AnimationPlayer = $Transition
@onready var click: AudioStreamPlayer = $Click

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sane_mouse_entered() -> void:
	sane_hover.play("Hover_Over_S")


func _on_sane_mouse_exited() -> void:
	sane_hover.play("Hover_Exit_S")


func _on_insane_mouse_entered() -> void:
	insane_hover.play("Hover_Over_I")


func _on_insane_mouse_exited() -> void:
	insane_hover.play("Hover_Exit_I")


func _on_insane_pressed() -> void:
	click.pitch_scale = randf_range(0.8, 1)
	click.play()
	Autoload.died = false
	Autoload.alive = true
	trans.play("FadeIn_Fast")


func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name == "FadeIn_Fast":
		get_tree().change_scene_to_file("res://scene/credits.tscn")


func _on_sane_pressed() -> void:
	click.pitch_scale = randf_range(0.8, 1)
	click.play()
	Autoload.died = true
	Autoload.alive = false
	trans.play("FadeIn_Fast")
