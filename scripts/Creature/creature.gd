extends Node2D
class_name Creature

# Creature's maximum attribute values
var max_energy: int = 100
var max_food: int = 100
var max_water: int = 100
var max_age: int = 100
var max_attack: int = 9999

# Creature's current attributes
var energy: int = max_energy
var food: int = max_food
var water: int = max_water
var age: int = 0
var attack: int = 0
var speed: int = 10


# Define WORLD_SIZE for boundary checking
const WORLD_SIZE: Vector2 = Vector2(1000, 1000)

func _ready():
	age = randi_range(1, max_age)
	attack = randi() % (max_attack + 1)

# Creature consumes nearby food. The creature's food increases, nearby food gets depleted.
func _eating():
	if food < max_food:
		food = min(max_food, food + 10)  # Increase food by 10 (can be adjusted)
		# Deplete food in the world (to be implemented)
	expend_energy()  # Consume energy for eating

# Creature moves in a simple 2D grid
# Creature moves by one tile in the specified direction
func _move_one_tile(direction: Vector2):
	# Ensure the direction is valid (either one unit up, down, left, or right)
	assert(abs(direction.x) + abs(direction.y) == 1)

	# Calculate the new tile position
	var new_tile_position = position + direction
	
	# Check if the new tile position is within the game board limits
	if new_tile_position.x >= 0 and new_tile_position.x < WORLD_SIZE.x and new_tile_position.y >= 0 and new_tile_position.y < WORLD_SIZE.y:
		# Update the creature's tile position
		position = new_tile_position
		# Log the move or update the creature's position on the game board if necessary
		print("Moved to new tile: ", position)
	else:
		# If the new position is outside the game board, do not move
		print("Movement outside game board bounds. Movement canceled.")

	# Energy expenditure could be adjusted here if necessary
	expend_energy()

# Creature sleeps, regenerating energy
func _sleeping():
	# Regenerate energy (to be implemented)
	expend_energy()  # Consume energy for sleeping

# Creature dies, game object is removed. A proportional amount of food is released to the location.
func _dying():
	# Release food to the location (to be implemented)
	queue_free()  # Remove the creature from the scene

# Creature breeds with another creature, producing offspring
func _breeding(partner: Creature):
	var offspring = Creature.new()
	# Calculate average attributes with random evolution factor
	offspring.age = (age + partner.age) / 2 + randi_range(-5, 5)
	offspring.attack = (attack + partner.attack) / 2 + randi_range(-100, 100)
	# Adjust offspring's attributes within limits
	offspring.age = clamp(offspring.age, 0, max_age)
	offspring.attack = clamp(offspring.attack, 0, max_attack)
	expend_energy()  # Consume energy for breeding
	return offspring

# Function to handle eating by the creature
func eat():
	food += 50  # Increase food by 50 (can be adjusted)

# Function to handle creature movement
func move(destination: Vector2):
	_move_one_tile(destination)

# Function to handle sleeping by the creature
func sleep():
	_sleeping()

# Function to handle creature dying
func die():
	_dying()

# Function to expend energy
func expend_energy():
	energy -= 5  # Adjust the energy consumption rate as needed
	energy = max(energy, 0)  # Ensure energy doesn't go below zero
