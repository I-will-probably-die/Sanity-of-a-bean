extends Timer

@onready var walk: AudioStreamPlayer3D = $Walk

func _on_timeout() -> void:
	walk.play()
