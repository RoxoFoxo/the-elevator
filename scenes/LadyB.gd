extends KinematicBody

var speed = 1

var move_inside = 0
var move_outside = 0

func _process(delta):
	if move_inside == 1:
		var direction
		var point = $"../LadyB_Position3D".translation
		
		if point.distance_to(transform.origin) > 0.01:
			direction = point - transform.origin
			direction = direction.normalized() * speed
			look_at(point, Vector3(0, point.y, 0))
		
		else:
			direction = point - transform.origin
			$"../LadyB_Position3D".translation = Vector3(-0.5, 0.5, -0.5)

		move_and_slide(direction)
		
	if move_outside == 1:
		var direction
		var point = $"../LadyA_Position3D".translation
		
		if point.distance_to(transform.origin) > 0.01:
			direction = point - transform.origin
			direction = direction.normalized() * speed
			look_at(point, Vector3(0, point.y, 0))
		
		else:
			direction = point - transform.origin
			$"../LadyA_Position3D".translation = Vector3(-1.2, 0.5, 3.1)

		move_and_slide(direction)

func _on_Act1_move_inside():
	yield(get_tree().create_timer(1), "timeout")
	move_inside = 1

func _on_Act1_move_outside():
	$"../LadyA_Position3D".translation = Vector3(0, 0.5, 1)
	move_inside = 0
	move_outside = 1
