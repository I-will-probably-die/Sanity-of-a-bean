extends Node3D

var sense = 0.005
var movable = true


# rotates the head and clamps
func _input(event: InputEvent) -> void:
	if movable == true && event is InputEventMouseMotion:
		get_parent().rotate_y(-event.relative.x * sense)
		rotate_x(-event.relative.y * sense)
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))
	if Input.is_action_just_pressed("pause"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
