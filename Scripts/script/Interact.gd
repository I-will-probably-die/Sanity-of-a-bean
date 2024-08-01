extends RayCast3D

var text

func _ready() -> void:
	text = get_node("/root/" + get_tree().current_scene.name + "/UI/Interact")


func _process(delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
		if hit.has_method("interact"):
			text.visible = true
			if Input.is_action_just_pressed("interact"):
				hit.interact()
		else:
			text.visible = false
	else:
		text.visible = false
