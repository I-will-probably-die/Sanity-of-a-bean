extends Control

var toggle = false

#shows notepad on pressing F
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Notepad"):
		get_node("/root/" + get_tree().current_scene.name + "/Player/Head/Notepad").visible = toggle
		get_node("/root/" + get_tree().current_scene.name + "/Player/Head").movable = toggle
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		visible = true
	if Input.is_action_just_pressed("back"):
		get_node("/root/" + get_tree().current_scene.name + "/Player/Head/Notepad").visible = !toggle
		get_node("/root/" + get_tree().current_scene.name + "/Player/Head").movable = !toggle
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		visible = false


func _on_button_pressed() -> void:
	get_node("/root/" + get_tree().current_scene.name + "/Player/Head/Notepad").visible = !toggle
	get_node("/root/" + get_tree().current_scene.name + "/Player/Head").movable = !toggle
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	visible = false
