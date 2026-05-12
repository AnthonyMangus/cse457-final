extends Camera3D

@export var target : Node3D
@export var speed := 3

func _process(delta: float) -> void:
	#global_position = lerp(position, target.global_position, delta * speed)
	var target_quat = Quaternion(target.global_transform.basis)
	var current_quat = Quaternion(transform.basis)
	transform.basis = Basis(current_quat.slerp(target_quat, delta*speed))
	#rotation = lerp(rotation, target.global_rotation, delta * speed)
	position = lerp(position, target.global_position, delta * speed)