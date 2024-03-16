#Creature attributes must have limits, i.e. 9999 attack 9999 energy is not possible
#create class Creature
#attributes
##Attack
##Energy
##

#Functions:
#Shitting :) :)

#Sleeping

class_name Creature

## CreatureResource, gets populated as the Node3D object is initialized into the scene
@export var stats: Resource
@export var energy: int
@export var food: int
@export var water: int
@export var age: int
@export var attack: int

var energy = 100
var food = 100
var water = 100
var attack = 0
var age = 0
var speed = 10
var position_x = 0
var position_y = 0

# Initialize with random attribute values
func _init():
	# Only randomizing age for now, others start at maxed values 
	age = randi_range(1, 100)

	pass

#Creating (Birthing) creature         
#This takes a certain amount of time, energy, food and water. The stats of the offspring will be the average of the parents + random evolution factor
func _breeding():
	
	#return offspring
	
	pass

#Creature consumes nearby food. The food of the creature increases, food nearby gets depleted. 
func _eating():
	pass
	#Creature.food++
	#World.food--
	#return
	
#Creature dies, game object is removed. A proportional amount of food is released to the location. 
func _dying():
	pass

#Creature moves (in simple 2D grid) 
func _moving():

func _ready():
	pass

func _process():
	pass

func eat():
    food += 50

#Functions:
#Shitting :) :)
#Dying
#Eating
#Creating (Birthing) creature
#Moving
#Sleeping