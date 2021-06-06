extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	$BeachBall.visible = false
	$Mirror.visible = false
	$Elevator/Radio.visible = false
	$Act1.run()

func _on_Player_pressing_big_red_button():
	$Act1.button_pressed()

func _on_Act1_finished():
	# TODO:
	# Act2.run()
	pass
