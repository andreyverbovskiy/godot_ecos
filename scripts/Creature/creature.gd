extends Node3D

class_name Creature

## CreatureResource, gets populated as the Node3D object is initialized into the scene
@export var stats: Resource

func _init():
    stats = load("res://resources/CreatureResource.tres")
    stats.emit_changed()
    

func _ready():
    if stats:
        pass





#Functions:
#Shitting :) :)
#Dying
#Eating
#Creating (Birthing) creature
#Moving
#Sleeping