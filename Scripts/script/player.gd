extends CharacterBody3D

var movable = true

# speed vars
@export var speed = 3.7
@export var sprint_speed = 4.5
var og_speed

# stamina stats
var stamina
var stamina_drain = 0.35
var stamina_regain = 0.2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

#setting what OG Speed is.
func _ready() -> void:
	og_speed = speed
	stamina = get_node("/root/" + get_tree().current_scene.name + "/UI/Stamina")

# stamina stuff
func _process(delta: float) -> void:
	if speed == sprint_speed:
		stamina.value = stamina.value - stamina_drain * delta
		if stamina.value == stamina.min_value:
			speed = og_speed
	if speed != sprint_speed:
		if stamina.value < stamina.max_value:
			stamina.value = stamina.value + stamina_regain * delta
		if stamina.value == stamina.max_value:
			stamina.visible = false
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	if movable == true:
		# Add the gravity.
		if not is_on_floor():
			velocity.y -= gravity * delta


		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir := Input.get_vector("left", "right", "forward", "backward")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
			
			
			#sprint speed changes
			if Input.is_action_just_pressed("sprint"):
				speed = sprint_speed
				stamina.visible = true
			if Input.is_action_just_released("sprint"):
				speed = og_speed
		
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.z = move_toward(velocity.z, 0, speed)

		move_and_slide()

