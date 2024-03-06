extends Node3D

class_name Creature

## CreatureResource, gets populated as the Node3D object is initialized into the scene
@export var stats: Resource
@export var energy: int
@export var food: int
@export var water: int
@export var age: int
@export var attack: int

func _init():
    if !stats:
        stats = load("res://resources/CreatureResource.tres")
    energy = stats.energy
    food = stats.food
    water = stats.water
    age = stats.age
    attack = stats.attack


func _enter_tree():
    print("Creature entered")

func _ready():
    
    if stats:
        pass

func _process(_delta):
    food -= 1
    if food < 50:
        print("Eating!")
        eat()
    print(food)


func eat():
    food += 50


#Functions:
#Shitting :) :)
#Dying
#Eating
#Creating (Birthing) creature
#Moving
#Sleeping