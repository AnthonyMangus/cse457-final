@tool
extends EditorScenePostImport

func _post_import(scene):
    print("Changing materials to toon mode...")
    toonify(scene)
    return scene

func toonify(node):
    if node is MeshInstance3D:
        for i in range(node.mesh.get_surface_count()):
            var existing_material = node.mesh.surface_get_material(i)
            existing_material.diffuse_mode = BaseMaterial3D.DIFFUSE_TOON
            existing_material.specular_mode = BaseMaterial3D.SPECULAR_TOON
    for child in node.get_children():
        toonify(child)