extends Node

#USED FOR TESTING CREATURE SPAWNING, EATING, BREEDING, DYING, PREDATION ETCS MECHANICS. 
#2d game board, 1000x1000 tiles, 
#Food items are randomly distributed across the game board and they randomly spawn
#Creatures live, are born, and die on the game board.

const WORLD_SIZE = Vector2(1000, 1000)  # Size of the game board

# Called when the node enters the scene tree for the first time.
func _ready():
	# Create a TileMap node to represent the game board
	var tilemap = TileMap.new()
	add_child(tilemap)

	# Set the size of the tilemap based on the world size
	tilemap.set_cell_size(Vector2(32, 32))  # Adjust cell size as needed
	tilemap.set_tile_size(Vector2(32, 32))  # Adjust tile size as needed

	# Scatter food items randomly across the game board
	scatter_food(tilemap)

# Scatter food items randomly across the game board
func scatter_food(tilemap):
	var num_food_items = 100  # Number of food items to scatter
	var food_tile = 1  # Assuming tile index 1 represents food

	for i in range(num_food_items):
		var random_position = Vector2(randf_range(0, WORLD_SIZE.x), randf_range(0, WORLD_SIZE.y))
		tilemap.set_cell(random_position, food_tile)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
