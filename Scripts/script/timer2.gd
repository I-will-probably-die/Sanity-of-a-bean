extends Timer

@onready var crawl: AudioStreamPlayer3D = $Crawl

func _on_timeout() -> void:
	crawl.play()
