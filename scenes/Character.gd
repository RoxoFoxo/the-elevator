extends KinematicBody

var speed = 10
var point = Vector3(0, 0.5, 0)

func _process(delta):

	var direction

	if point.distance_to(transform.origin) > 0.05:
		direction = point - transform.origin
		direction = direction.normalized() * speed

	else:
		direction = point - transform.origin

	move_and_slide(direction) 

