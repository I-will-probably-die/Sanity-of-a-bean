extends Node

@onready var vent: AudioStreamPlayer = $Vent
@onready var room: AudioStreamPlayer = $Room
@onready var room_2: AudioStreamPlayer = $Room2

func _ready() -> void:
	vent.play()
	room.play()
	room_2.play()
