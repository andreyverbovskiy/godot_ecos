#create class Creature
#attributes
##Attack
##Energy
##

#Functions:
#Shitting :) :)

#Dying

#Eating

#Creating (Birthing) creature

#Moving

#Sleeping

class_name Creature

# Attributes

var energy = 100
var food = 100
var water = 100
var attack = 0
var age = 0

# Initialize with random attribute values
func _init():
    # Only randomizing age for now, others start at maxed values 
    age = randi_range(1,100)

    pass

func _ready():
    pass

func _process():
    pass

