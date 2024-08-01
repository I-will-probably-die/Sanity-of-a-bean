extends AnimationPlayer

@onready var trans: AnimationPlayer = $"."
@onready var click: AudioStreamPlayer = $"../Click"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trans.play("Fadeout")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_fin_pressed() -> void:
	trans.play("Fadein")
	Autoload.start = false


func _on_play_pressed() -> void:
	click.pitch_scale = randf_range(0.8, 1.1)
	click.play()
	trans.play("Fadein")
