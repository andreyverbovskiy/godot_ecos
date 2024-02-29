class_name CreatureResource

extends Resource

@export var energy: int
@export var food: int
@export var water: int
@export var age: int
@export var attack: int


func _init(p_energy = 100, p_food = 100, p_water = 100, p_age = 50, p_attack = 0):
    energy = p_energy
    food = p_food
    water = p_water
    age = p_age
    attack = p_attack