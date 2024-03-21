extends Node3D


var apple = preload("res://scenes/food_apple.tscn") 

var spawn_number = 1

var random = RandomNumberGenerator.new() 


var spawn_interval = 2.0 # Interval between spawns in seconds
var spawn_timer = 0.0

#position of our Nature node. as we extend it we can just use position  

var local_position = position 
var node_scale = scale 

  

# Called when the node enters the scene tree for the first time. 

func _ready(): 
	spawn_timer = spawn_interval 

  

  

func spawn(): 
	for i in range(spawn_number): 
		var obj = apple.instantiate() 
		obj.transform.origin = getRandomPosition(local_position, node_scale) 
		add_child(obj) 
		print('spawned object')

  

  

# my dumb ass logic is that the scenter of the node is the position, so we set the object in between center minus half  

# which is lower biundary and center plus half the size for upper boundary 


# it was too grouped and if we are at coordinate 0.0.0, then just having -abs(2 * size.x), abs(2 * size.x) is enough
  

func getRandomPosition(coord,size) -> Vector3: 
	random.randomize() 

	var x = random.randf_range(-abs(2 * size.x), abs(2 * size.x)) # random.randf_range(-abs(coord.x-(size.x/2)), abs(coord.x-(size.x/2)))
	var z = random.randf_range(-abs(1.85*(size.z)), abs(1.70*(size.z))) #random.randf_range(-abs(coord.z-(size.z/2)), abs(coord.z-(size.z/2)))
	var y = coord.y #random.randf_range(coord.z, size.y) 

	return Vector3(x,y,z) 

  

# Called every frame. 'delta' is the elapsed time since the previous frame. 

func _process(delta): 
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn()
		spawn_timer = spawn_interval 

 
