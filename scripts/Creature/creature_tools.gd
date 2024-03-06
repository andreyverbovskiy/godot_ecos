@tool
extends Node3D

@export_category("Debug")

@export var creature: PackedScene = preload("res://scenes/creature_testing/creature.tscn")
@export var spawnNewCreature: bool:
    set(value):
        _spawn_new_creature()
@export var deleteAllCreatures: bool:
    set(value):
        _delete_all_creatures()


func _init():
    pass

func _ready():
    pass




func _spawn_new_creature() -> void:
    var _child = creature.instantiate()
    var scene_root: Node = EditorInterface.get_edited_scene_root()
    self.add_child(_child, true)
    _child.set_owner(scene_root)

func _delete_all_creatures() -> void:
    var _children := get_children()
    for c in _children:
        c.queue_free()
