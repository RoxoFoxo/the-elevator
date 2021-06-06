extends Node

# called by MainScene to run the act
export var run = false

# How much complain will happen
var waiting = 0.0
var complain = 1

# waiting to the player fucking press the button
var needs_press = false

# act number, 0 = wait we are on the mid of one
var act = 1

# sends to the MainScene, so it can start another act
signal finished

# from MainScene
func run():
	run = true

func _process(delta):
	if not run:
		return
	if needs_press:
		waiting = waiting + delta
		_complain(waiting)
		return
	if act == 1:
		act = 0
		_act1()
	if act == 2:
		act = 0
		_act2()
	if act == 3:
		act = 0
		emit_signal("finished")

func _complain(time):
	if time > 5 and complain == 1:
		_say("So... can you press the button?", 0.05)
		complain = 2
	if time > 15 and complain == 2:
		_say("For gods sake, can you press the button?", 0.05)
		complain = 3
	if time > 30 and complain == 3:
		_say("Are you really keep us all waiting???", 0.03)
		complain = 4
	if time > 60 and complain == 4:
		_say("Fuck you Im gonna press it myself", 0.02)
		button_pressed()
	yield($"../Dialog", "done")

# entering elevator...
func _act1():
	print_debug("starting act 1 p/ 1")
	yield(get_tree().create_timer(1), "timeout")
	_toggle_door()
	# TODO: add trigger to person enter the elevator
	yield(get_tree().create_timer(1), "timeout")
	_say("Can you let us on the 10st floor?", 0.05)
	yield($"../Dialog", "done")
	# configuration to act 2:
	needs_press = true
	act = 2
	print_debug("act 1 p/ 1 done")

# conversation while going up
func _act2():
	print_debug("starting act 1 p/ 2")
	yield(get_tree().create_timer(2), "timeout")
	# A
	_say("So, about what you are saying", 0.05)
	_say("yes nowadays its easy to missunderstand people", 0.05)
	_say("did you know that my boyfrind thought that I" +
	" was pregnant just because I wanted a pinaple on my milkshake?", 0.05)
	yield($"../Dialog", "done")
	# B
	_say("... for sure, this happens to me everytime!", 0.05)
	_say("Yersterday some students thought that I was a famous model, I was flattered", 0.05)
	yield($"../Dialog", "done")
	# A
	_say("Maybe you need to apply to as model haha", 0.05)
	# B
	_say("Never, I dont like to be famous", 0.05)
	_say("only bad things happens with fammous people", 0.05)
	_say("even more if you have a BlueBird account", 0.05)
	yield($"../Dialog", "done")
	# "nossa ta faltando algo: aparece a msuica do elevador"
	# "nossa gostaria de saber minha aparencia: aparece o espelho"
	act = 3
	print_debug("act 1 p/ 2 done")

# from self and MainScene
func button_pressed():
	if needs_press:
		needs_press = false
		_toggle_door()

#
# Utils
#

func _say(text, time):
	$"../Dialog".add_say(text, time)

func _toggle_door():
	$"../Elevator".toggle_door()
