extends Camera3D


var movement_speed = 10.0
var sensitivity = 0.2

func _process(delta):
	# Get input for movement
	var movement_vector = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		movement_vector.z -= 1
	if Input.is_action_pressed("move_backward"):
		movement_vector.z += 1
	if Input.is_action_pressed("move_left"):
		movement_vector.x -= 1
	if Input.is_action_pressed("move_right"):
		movement_vector.x += 1
	if Input.is_action_pressed("move_up"):
		movement_vector.y += 1
	if Input.is_action_pressed("move_down"):
		movement_vector.y -= 1

	# Normalize and scale movement vector
	movement_vector = movement_vector.normalized() * movement_speed * delta

	# Apply movement relative to camera rotation
	movement_vector = global_transform.basis.xform(movement_vector)

	# Move the camera
	translate(movement_vector)

	# Rotate the camera based on mouse movement
	var mouse_delta = Input.get_mouse_delta()
	rotate_y(deg2rad(-mouse_delta.x * sensitivity))
	rotate_x(deg2rad(-mouse_delta.y * sensitivity))
