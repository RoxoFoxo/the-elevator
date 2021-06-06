extends KinematicBody

func _process(delta):
	look_at($"../Player/position3D", Vector3(0, $"../Player/position3D".y, 0))
