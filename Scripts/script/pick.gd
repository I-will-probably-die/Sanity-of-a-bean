extends Control

@onready var hover_pa: AnimationPlayer = $Passive/Hover_PA
@onready var hover_k: AnimationPlayer = $Nice/Hover_K
@onready var hover_p: AnimationPlayer = $Persistent/Hover_P
@onready var hover_a: AnimationPlayer = $Agression/Hover_A
@onready var trans: AnimationPlayer = $Transition
var pa = false
var k = false
var p = false
var a = false
@onready var click: AudioStreamPlayer = $Click


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	trans.play("Fadeout")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#region New Code Region

func _on_nice_mouse_entered() -> void:
	hover_k.play("Mouse_Over_k")


func _on_nice_mouse_exited() -> void:
	hover_k.play("Mouse_Exit_k")


func _on_persistent_mouse_entered() -> void:
	hover_p.play("Mouse_Over_p")


func _on_persistent_mouse_exited() -> void:
	hover_p.play("Mouse_Exit_p")

func _on_hover_a_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Mouse_Exit_a":
		hover_a.play("Text_move_a")


func _on_hover_k_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Mouse_Exit_k":
		hover_k.play("Text_move_k")


func _on_hover_p_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Mouse_Exit_p":
		hover_p.play("Text_Move_p")

func _on_agression_mouse_entered() -> void:
	hover_a.play("Mouse_Over_a")


func _on_agression_mouse_exited() -> void:
	hover_a.play("Mouse_Exit_a")


func _on_hover_pa_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Mouse_Exit_pa":
		hover_pa.play("Text_move_pa")


func _on_passive_mouse_entered() -> void:
	hover_pa.play("Mouse_Over_pa")


func _on_passive_mouse_exited() -> void:
	hover_pa.play("Mouse_Exit_pa")




#endregion



func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fadein":
		if pa == true:
			get_tree().change_scene_to_file("res://scene/Passive.tscn")
		elif k == true:
			get_tree().change_scene_to_file("res://scene/Kind.tscn")
		elif p == true:
			get_tree().change_scene_to_file("res://scene/Persistant.tscn")
		elif a == true:
			get_tree().change_scene_to_file("res://scene/aggressive.tscn")

func _on_nice_pressed() -> void:
	click.pitch_scale = randf_range(0.8, 1.1)
	click.play()
	k = true
	trans.play("Fadein")


func _on_persistent_pressed() -> void:
	click.pitch_scale = randf_range(0.8, 1.1)
	click.play()
	p = true
	trans.play("Fadein")


func _on_passive_pressed() -> void:
	click.pitch_scale = randf_range(0.8, 1.1)
	click.play()
	pa = true
	trans.play("Fadein")

func _on_agression_pressed() -> void:
	click.pitch_scale = randf_range(0.8, 1)
	click.play()
	a = true
	trans.play("Fadein")
