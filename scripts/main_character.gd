extends CharacterBody2D

const SPEED = 300.0
const FIRST_JUMP_VELOCITY = -770.0
const SECOND_JUMP_VELOCITY = -650.0
const MAX_JUMPS = 2
var jump_count = 0

@onready var sprite_2d = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if is_on_floor():
		jump_count = 0
		if velocity.x < 0 or velocity.x > 0:
			sprite_2d.animation = "run"
		else:
			sprite_2d.animation = "idle"
	else:
		velocity.y += gravity * delta
		if velocity.y < 0:
			sprite_2d.animation = "jump"
		elif velocity.y > 0:
			sprite_2d.animation = "fall"

	if (Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("ui_up")) and jump_count < MAX_JUMPS:
		if jump_count == 0:
			velocity.y = FIRST_JUMP_VELOCITY
		else:
			velocity.y = SECOND_JUMP_VELOCITY
		jump_count += 1

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		sprite_2d.flip_h = is_facing_left(velocity.x)
	else:
		velocity.x = move_toward(velocity.x, 0, 0.1 * SPEED)

	move_and_slide()

func is_facing_left(velocity_x):
	return velocity_x < 0
