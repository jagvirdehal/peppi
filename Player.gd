class_name Player

extends CharacterBody3D

const SPEED = 5.0
const HOP_VELOCITY = 5
const JUMP_VELOCITY = 6.5
const GRAVITY = 15

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Player state
var fast_fall = false
var num_jumps = 1

# Editor settings
@export var player_prefix : String

# Player input
var input_prefix : String
var INPUT_JUMP : String
var INPUT_LEFT : String
var INPUT_RIGHT : String
var INPUT_DOWN : String
var INPUT_UP : String

func _ready():
	input_prefix = player_prefix + "_"
	INPUT_JUMP = input_prefix + "jump"
	INPUT_LEFT = input_prefix + "left"
	INPUT_RIGHT = input_prefix + "right"
	INPUT_DOWN = input_prefix + "down"
	INPUT_UP = input_prefix + "up"

func get_axis():
	return Input.get_vector(
		INPUT_LEFT,
		INPUT_RIGHT,
		INPUT_DOWN,
		INPUT_UP
	)

# TODO: Replace this with some kind of static function var
var start_jump = false
var time_pressed = 0
func handle_jump(delta):
	const HOP_THRESHOLD = 0.05

	if Input.is_action_just_pressed(INPUT_JUMP):
		start_jump = true

	if start_jump:
		if Input.is_action_pressed(INPUT_JUMP):
			time_pressed += delta
			print(time_pressed)

		if time_pressed > HOP_THRESHOLD or Input.is_action_just_released(INPUT_JUMP):
			if not is_on_floor():
				num_jumps -= 1
			velocity.y = JUMP_VELOCITY if time_pressed > HOP_THRESHOLD else HOP_VELOCITY
			time_pressed = 0
			start_jump = false

func _physics_process(delta):
	# Add the gravity.
	if is_on_floor():
		fast_fall = false
		num_jumps = 1
	else:
		velocity.y -= GRAVITY * delta * (10 if fast_fall else 1)

	if num_jumps > 0:
		handle_jump(delta)

	# Get input direction
	var input_dir = get_axis()
	var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()

	# Handle movement
	if direction:
		velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 2)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

	# Activate fast fall
	if input_dir.y < 0 and velocity.y < 0:
		fast_fall = true

	move_and_slide()
