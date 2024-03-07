extends Node3D

#var apple_scene : PackedScene
#var time_since_last_spawn : float = 0
#var min_spawn_delay : float = 1
#var max_spawn_delay : float = 5
#
#func _ready():
	#if not is_instance_valid(apple_scene):
		#apple_scene = preload("res://scenes/food_apple.tscn")
#
#func _process(delta):
	#time_since_last_spawn += delta
	#if time_since_last_spawn >= randf_range(min_spawn_delay, max_spawn_delay):
		#spawn_apple()
		#time_since_last_spawn = 0
#
#func spawn_apple():
	#if apple_scene:
		#var apple_instance = apple_scene.instantiate()
		#$Nature.add_child(apple_instance)
		#apple_instance.transform.origin = generate_random_position()
#
#func generate_random_position() -> Vector3:
	#var nature_mesh = find_nature_mesh($Nature)
	#if nature_mesh:
		#var world_transform = nature_mesh.global_transform
		#var nature_position = world_transform.origin
		#var nature_scale = world_transform.basis.get_scale()
		#
		#var nature_extents = nature_mesh.mesh.size * nature_scale * Vector3(0.5, 0.5, 0.5)
		#var x = randf_range(-nature_extents.x, nature_extents.x)
		#var y = randf_range(-nature_extents.y, nature_extents.y)
		#var z = randf_range(-nature_extents.z, nature_extents.z)
		#return nature_position + Vector3(x, y, z)
	#else:
		##print_scene_hierarchy($Nature)
		##print("Nature mesh not found.")
		#return Vector3.ZERO
#
#func find_nature_mesh(node: Node3D) -> Node3D:
	#for child in node.get_children():
		##print("Checking child: ", child.name)
		#if child is Node3D: # Check if the child is a Node3D
			#var result = find_nature_mesh(child)
			#if result:
				#return result
		#elif "mesh" in child: # Check if the child has a 'mesh' property
			#print("Mesh found: ", child.name)
			#return child
	#return null
#
#func print_scene_hierarchy(node: Node3D, depth: int = 0):
	#var indent = "\t" # Using tab for indentation
	#for i in range(depth):
		#indent += "\t"
	#print(indent + node.name + " (" + str(node) + ")")
	#for child in node.get_children():
		#print_scene_hierarchy(child, depth + 1)
