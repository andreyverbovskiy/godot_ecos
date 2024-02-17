extends MeshInstance3D

var move_speed = 2 

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector3(randf_range(-1, 1), 0, randf_range(-1, 1)).normalized()
	var velocity = direction * move_speed * delta
	translate(velocity)
