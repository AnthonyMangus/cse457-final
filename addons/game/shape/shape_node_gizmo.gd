extends EditorNode3DGizmoPlugin

var shapes : Dictionary

func _get_gizmo_name() -> String:
    return "Shape"

func _has_gizmo(for_node_3d: Node3D) -> bool:
    # go through properties, see if BoxShape3D is one of them
    for property in for_node_3d.get_property_list():
        # type is of Object
        if property.get("type") == 24:
            # Object is of BoxShape3D
            if for_node_3d.get(property.get("name")) is BoxShape3D:
                shapes[for_node_3d] = property.get("name")
                return true
    return false

func _init():
    create_material("main", Color(1, 0, 0))

func _redraw(gizmo):
    gizmo.clear()

    var node3d : Node3D = gizmo.get_node_3d()
    var shape : BoxShape3D = node3d.get(shapes.get(node3d))

    gizmo.add_mesh(shape.get_debug_mesh())