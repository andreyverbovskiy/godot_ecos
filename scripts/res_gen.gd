extends Node3D

var apple = preload("res://scenes/food_apple.tscn") 
var spawn_number = 1
var random = RandomNumberGenerator.new() 
var spawn_interval = 2.0 # Interval between spawns in seconds
var spawn_timer = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_timer = spawn_interval

# Function to spawn resources such as food
func spawn():
	for i in range(spawn_number):
		var obj = apple.instance()  # Use instance() instead of instantiate()
		obj.translation = getRandomPosition()  # Set the translation directly
		add_child(obj)  # Add the resource to the scene
		print('Spawned object')

# Function to get a random position within the node's bounds
func getRandomPosition() -> Vector3:
	var size = scale * 2  # Calculate the size of the node
	random.randomize()
	var x = random.randf_range(-size.x, size.x)  # Adjusted range for x-coordinate
	var z = random.randf_range(-size.z, size.z)  # Adjusted range for z-coordinate
	var y = 0  # Set y-coordinate to 0 (assuming the ground level)
	return Vector3(x, y, z)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn()
		spawn_timer = spawn_interval
