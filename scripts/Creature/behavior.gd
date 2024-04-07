extends Node2D

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


# Initialize with random attribute values
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
func _moving(destination: Vector2, delta: float):
	# Calculate direction vector towards destination
	var direction = (destination - position).normalized()
	# Move towards the destination with specified speed
	position += direction * speed * delta
	expend_energy()  # Consume energy for moving

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
func move(destination: Vector2, delta: float):
	_moving(destination, delta)

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
