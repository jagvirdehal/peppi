class_name Player

extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var fast_fall = false

# Controls
var INPUT_UP = null
var INPUT_DOWN = null
var INPUT_LEFT = null
var INPUT_RIGHT = null
var INPUT_JUMP = null

func _init(player_prefix: String):
	INPUT_UP = player_prefix + "up"
	INPUT_DOWN = player_prefix + "down"
	INPUT_LEFT = player_prefix + "left"
	INPUT_RIGHT = player_prefix + "right"
	INPUT_JUMP = player_prefix + "jump"

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		if fast_fall:
			velocity.y -= 10 * gravity * delta
	elif fast_fall:
		fast_fall = false

	if not is_on_floor() and velocity.y < 1 and Input.is_action_just_pressed(INPUT_DOWN):
		fast_fall = true

	# Handle jump.
	if Input.is_action_just_pressed(INPUT_JUMP) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector(INPUT_LEFT, INPUT_RIGHT, INPUT_UP, INPUT_DOWN)
	var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
