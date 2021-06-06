extends Spatial

var door_open = false

func is_door_open():
	return door_open

func toggle_door():
	if door_open:
		$Door/Left/MeshInstance.translate(Vector3(-0.49, 0, 0))
		$Door/Right/MeshInstance.translate(Vector3(-0.49, 0, 0))
		door_open = false
	else:
		$Door/Left/MeshInstance.translate(Vector3(0.49, 0, 0))
		$Door/Right/MeshInstance.translate(Vector3(0.49, 0, 0))
		door_open = true

func disable_collision():
	$Door/Left/CollisionShape.disabled = true
	$Door/Right/CollisionShape.disabled = true
