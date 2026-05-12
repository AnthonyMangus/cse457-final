extends PathFollow3D

@export var h_variation : float
@export var base_speed : float
@export var speed_variation : float
@export var sprites : Array[Texture]

var reversed : bool
var speed : float
var current_path : Path3D

func _ready() -> void:
	reversed = bool(randi() % 2)
	speed = base_speed + randf_range(-speed_variation, speed_variation)
	#$Sprite.mesh.material.texture = sprites.pick_random()

func _process(delta: float) -> void:
	self.progress_ratio += speed * delta
	if self.progress_ratio >= 1:
		self.progress_ratio = 0
