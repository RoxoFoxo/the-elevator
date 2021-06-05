extends Spatial

func _ready():
	$Left/MeshInstance.translate(Vector3(0.49, 0, 0))
	$Right/MeshInstance.translate(Vector3(0.49, 0, 0))
