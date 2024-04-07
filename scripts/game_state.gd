# Contains all the information about the game state
# Logs the game state and history to gamestate.txt
@tool
extends EditorScript

# Define class GameState
class_name GameState

# Import necessary classes
const Creature = preload("res://scripts/Creature/creature.gd")
const GameWorld = preload("res://scripts/game_world.gd")
const ResourceGeneration = preload("res://scripts/res_gen.gd")

# Game state attributes
var creatures: Array
var food_items: Array
var game_world: GameWorld
var resource_generation: ResourceGeneration

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize arrays to store creatures and food items
	creatures = []
	food_items = []

	# Initialize game world
	game_world = GameWorld.new()
	resource_generation = ResourceGeneration.new()

	# Spawn creatures and food items
	spawn_creatures()
	spawn_food()

	# Log initial game state
	log_game_state()
	
	# Define and initialize write timer
	var write_timer = WRITE_INTERVAL

# Define write timer constants
const WRITE_INTERVAL = 60.0  # Adjust as needed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Update resource generation if resource_generation is defined
	if resource_generation:
		resource_generation._process(delta)
	
	# Update write timer
	write_timer -= delta
	if write_timer <= 0.0:
		write_game_state()
		write_timer = WRITE_INTERVAL

# Function to spawn creatures
func spawn_creatures():
	for i in range(100):  # Adjust the number of creatures as needed
		var creature = Creature.new()
		creature.position = Vector2(randf_range(0, 1000), randf_range(0, 1000))  # Random position on the game board
		creatures.append(creature)

# Function to spawn food items
func spawn_food():
	for i in range(100):  # Adjust the number of food items as needed
		var food_item = Sprite2D.new()  # Assuming food is represented by a Sprite2D node
		food_item.position = Vector2(randf_range(0, 1000), randf_range(0, 1000))  # Random position on the game board
		food_items.append(food_item)

# Function to log the game state to a text file
func log_game_state():
	print("HASDASDASD")
	var file = FileAccess.open("user://gamestate.txt", FileAccess.WRITE)
	
	if file != null:
		# Log game world
		file.store_line("Game World:")
		file.store_line("\n")  # Add a newline for separation
		
		# Log creatures
		file.store_line("Creatures:")
		for creature in creatures:
			file.store_line("Position: " + str(creature.position))
			file.store_line("Energy: " + str(creature.energy))
			file.store_line("Food: " + str(creature.food))
			file.store_line("Water: " + str(creature.water))
			file.store_line("Age: " + str(creature.age))
			file.store_line("Attack: " + str(creature.attack))
		file.store_line("\n")  # Add a newline for separation
		
		# Log food items
		file.store_line("Food Items:")
		for food_item in food_items:
			file.store_line("Position: " + str(food_item.position))
		
		file.close()
	else:
		print("Failed to open file for writing: user://gamestate.txt")

func _run():
	print("Hello from the Godot Editor!")
	
	var file = FileAccess.open("gamestate.txt", FileAccess.WRITE)
	if file != null:
		var pep = "xxxx2"
		file.store_line(pep)
		file.close()
	else:
		print("Failed to open file for writing: gamestate.txt")
