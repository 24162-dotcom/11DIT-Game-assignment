extends CharacterBody2D

class_name player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DASH := 1500.0
var start_position = Vector2(88.0, 278.0)
@onready var sfx_death: AudioStreamPlayer = $sfx_death

#dash stuff
var tween: Tween
var dash_velocity:= 0.0

func setup_for_new_level(spawn_pos: Vector2):
	global_position = spawn_pos
	set_physics_process(true)
	# Reset any other state variables here

func _physics_process(delta: float) -> void:
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#the dash + the movement
	if Input.is_action_just_pressed("player_ability"):
		dash_velocity = DASH
		if tween:
			tween.stop()
		tween = create_tween()
		tween.tween_property(self, "dash_velocity", 0, 0.3).set_ease(Tween.EASE_OUT)
	var direction = Input.get_axis("player_left", "player_right")
	
	if direction:
		velocity.x = direction * (SPEED + dash_velocity)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	#handle respawn
	if global_position.y > 3000:
		#respawn
		respawn()

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
func respawn():
	global_position = start_position
	sfx_death.play()
