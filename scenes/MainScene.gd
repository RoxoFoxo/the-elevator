extends Spatial

var act = 0
var can_press = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func next_act():
	if act == 1:
		_act_1()

func _act_1():
	$Dialog.add_say("Hoy", 0.05)
	$Dialog.next_say()

func _on_Player_pressing_big_red_button():
	if can_press:
		$Elevator.toggle_door()
