extends Node3D

@export var obstacles : Array[PackedScene]
@export var active_obstacles : Array[Node3D]
@export var spawn_area : BoxShape3D :
	set(new_spawn_area):
		spawn_area = new_spawn_area
		spawn_area.changed.connect(update_gizmos)
@export var wait_time := 3

@export var test : Curve3D

func _ready() -> void:
	var spawn_timer := Timer.new()
	spawn_timer.timeout.connect(spawn_obstacle)
	add_child(spawn_timer)
	spawn_timer.start(wait_time)

func spawn_obstacle() -> void:
	var new_obstacle = obstacles.pick_random().instantiate()
	new_obstacle.position = Vector3(
		position.x + randf_range((spawn_area.size.x) / -2, spawn_area.size.x / 2),
		position.y + randf_range((spawn_area.size.y) / -2, spawn_area.size.y / 2),
		position.z + randf_range((spawn_area.size.z) / -2, spawn_area.size.z / 2)
	)
	new_obstacle.position.x = position.x + randf_range((spawn_area.size.x) / -2, spawn_area.size.x / 2)
	add_child(new_obstacle)

