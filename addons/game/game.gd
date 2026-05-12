@tool
extends EditorPlugin

const ShapeGizmo = preload("shape/shape_node_gizmo.gd")

var shape_gizmo = ShapeGizmo.new()

func _enter_tree() -> void:
	#add_custom_type("Shape", "Node3D", preload("shape/shape_node.gd"), preload("shape/Shape.svg"))
	add_node_3d_gizmo_plugin(shape_gizmo)


func _exit_tree() -> void:
	#remove_custom_type("Shape")
	remove_node_3d_gizmo_plugin(shape_gizmo)
