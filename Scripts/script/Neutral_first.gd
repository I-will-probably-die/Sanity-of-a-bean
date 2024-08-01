extends Node3D

var toggle = false
@export var next_area: String = ""
@export var final_area: String = ""
@export var dialogue: String = ""
var first = false
@onready var trans: AnimationPlayer = $Transition
@onready var banging: AudioStreamPlayer3D = $Banging
@onready var timer: Timer = $Timer
@onready var light_3: AnimationPlayer = $Envi/Props/Light2/Light3
@onready var light_sfx: AudioStreamPlayer3D = $Envi/Props/Light2/LightSFX
@onready var control: Control = $Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("/root/" + get_tree().current_scene.name + "/Player").movable = toggle
	DialogueManager.show_dialogue_balloon(load(dialogue), "start")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	first = true
	if Autoload.start == true:
		trans.play("Intro")
	timer.start()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	control.visible = false

func _process(delta: float) -> void:
	if Autoload.passive_Fin == true:
		first = false
	if Autoload.perstist_Fin == true:
		first = false
	if Autoload.nice_Fin == true:
		first = false

func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fadein" && first == true:
		print("it worked")
		get_tree().change_scene_to_file(next_area)
	elif anim_name == "Fadein" && Autoload.passive_Fin == true:
		get_tree().change_scene_to_file(final_area)
	elif anim_name == "Fadein" && Autoload.nice_Fin == true:
		get_tree().change_scene_to_file(final_area)
	elif anim_name == "Fadein" && Autoload.perstist_Fin == true:
		get_tree().change_scene_to_file(final_area)


func _on_timer_timeout() -> void:
	banging.play()
	light_3.play("Turn_off")
	light_sfx.stop()
