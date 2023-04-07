extends CharacterBody3D

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 6.0
var jump_speed = 6.0
var mouse_sensitivity = 0.002

func get_input():
	var input = Input.get_vector("strafe_left", "strafe_right", "move_forward", "move_back")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = movement_dir.x * speed
	velocity.z = movement_dir.z * speed
#	velocity.x = input.x * speed
#	velocity.z = input.y * speed

func _physics_process(delta):
	velocity.y += -gravity * delta
	get_input()
	move_and_slide()

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
