extends Obstacle

@export var upward_speed := 1.
@export var upward_speed_variation := 1.
@export var wait_time := 2.


@onready var balloon := $BalloonCollider
var velocity : Vector3

func _ready() -> void:
	hide()

func _ready_obstacle():
	show()
	var timer = Timer.new()
	timer.wait_time = wait_time
	timer.autostart = true
	timer.timeout.connect(release_balloon)
	add_child(timer)

func release_balloon():
	velocity = Vector3(0, upward_speed + randf_range(-upward_speed, upward_speed), 0)

func _process(delta: float) -> void:
	balloon.position += velocity * delta