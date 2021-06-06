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

# move characters
signal move_inside

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
		_say1("So... can you press the button?", 0.05)
		complain = 2
	if time > 15 and complain == 2:
		_say1("For gods sake, can you press the button?", 0.05)
		complain = 3
	if time > 30 and complain == 3:
		_say1("Are you really keep us all waiting???", 0.07)
		complain = 4
	if time > 60 and complain == 4:
		_say1("Fuck you Im gonna press it myself", 0.08)
		button_pressed()
	yield($"../Dialog", "done")

# entering elevator...
func _act1():
	print_debug("starting act 1 p/ 1")
	yield(get_tree().create_timer(1), "timeout")
	_toggle_door()
	# they enter the elevator
	emit_signal("move_inside")
	yield(get_tree().create_timer(1), "timeout")
	_say1("Can you let us on the 10st floor?", 0.05)
	yield($"../Dialog", "done")
	# configuration to act 2:
	needs_press = true
	act = 2
	print_debug("act 1 p/ 1 done")

# conversation while going up
func _act2():
	print_debug("starting act 1 p/ 2")
	yield(get_tree().create_timer(7), "timeout")
	# A
	_say1("So, about what you are saying...", 0.06)
	yield($"../Dialog", "done")
	_say1("nowadays its easy to missunderstand people", 0.05)
	yield($"../Dialog", "done")
	_say1("did you know that my boyfrind thought that I" +
	" was pregnant just because I wanted a pinaple on my milkshake?", 0.05)
	yield($"../Dialog", "done")
	# = pause
	yield(get_tree().create_timer(1), "timeout")
	# B
	_say2("... for sure, this happens to me everytime!", 0.05)
	yield($"../Dialog", "done")
	# pause
	yield(get_tree().create_timer(7), "timeout")
	_say2("so... ...", 0.1)
	yield($"../Dialog", "done")
	_say2("this elevator is strange... its almost something is missing", 0.05)
	yield($"../Dialog", "done")
	_say2("maybe music?", 0.05)
	yield($"../Dialog", "done")
	# = pause
	yield(get_tree().create_timer(1), "timeout")
	# A
	_say1("Oh you right, but I can solve that...", 0.05)
	yield($"../Dialog", "done")
	# + RADIO
	$"../Music".play(0)
	$"../Elevator/Radio".visible = true
	# pause
	yield(get_tree().create_timer(3), "timeout")
	# B
	_say2("Oh my god", 0.12)
	yield($"../Dialog", "done")
	_say2("Are you walking with radios on your poket now?", 0.05)
	yield($"../Dialog", "done")
	# = pause
	yield(get_tree().create_timer(1), "timeout")
	# A
	_say1("Its from my boyfriend, he will not miss it out haha", 0.05)
	yield($"../Dialog", "done")
	# B
	_say2("Oh my god Bety, you are so mean", 0.09)
	yield($"../Dialog", "done")
	# A
	_say1("you know how I'am haha", 0.07)
	yield($"../Dialog", "done")
	# = pause
	yield(get_tree().create_timer(7), "timeout")
	_say2("... so...", 0.1)
	yield($"../Dialog", "done")
	_say2("Yersterday some students thought that I was a famous model, I was flattered", 0.05)
	yield($"../Dialog", "done")
	yield(get_tree().create_timer(1), "timeout")
	# A
	_say1("Maybe you need to apply as model haha", 0.05)
	yield($"../Dialog", "done")
	# B
	_say2("Never", 0.08)
	yield($"../Dialog", "done")
	_say2("I dont like to be famous", 0.05)
	yield($"../Dialog", "done")
	_say2("only bad things happens with fammous people", 0.05)
	yield($"../Dialog", "done")
	_say2("even more if you have a BlueBird account", 0.05)
	yield($"../Dialog", "done")
	# = pause
	yield(get_tree().create_timer(1), "timeout")
	# A
	_say1("Yeaaa...", 0.1)
	yield($"../Dialog", "done")
	_say1("I already blocked a bunch of crazzy people on that thing", 0.05)
	yield($"../Dialog", "done")
	# B
	_say2("Why do you even have one?", 0.05)
	yield($"../Dialog", "done")
	# = pause
	yield(get_tree().create_timer(1), "timeout")
	# A
	_say1("You know... you need to be updated with the world thrends", 0.05)
	yield($"../Dialog", "done")
	# = pause
	yield(get_tree().create_timer(1), "timeout")
	# B
	_say2("uhmm", 0.05)
	yield($"../Dialog", "done")
	yield(get_tree().create_timer(3), "timeout")

	# = pause
	yield(get_tree().create_timer(5), "timeout")
	# A
	_say1("... I wonder how is my look right now", 0.05)
	yield($"../Dialog", "done")
	# B
	_say2("Dont worry Bety", 0.07)
	yield($"../Dialog", "done")
	_say2("I can solve that for you", 0.05)
	yield($"../Dialog", "done")
	# + MIRROR
	$"../Mirror".visible = true
	# = pause
	yield(get_tree().create_timer(5), "timeout")
	# A
	_say1("what, were did you find something like that?", 0.03)
	yield($"../Dialog", "done")
	# B
	_say2("I bought it on the dollar store", 0.05)
	yield($"../Dialog", "done")
	# = pause
	yield(get_tree().create_timer(1), "timeout")
	# A
	_say1("... I can see that by the quality of the reflection", 0.06)
	yield($"../Dialog", "done")
	_say1("well, now I can be ready to the party", 0.05)
	yield($"../Dialog", "done")
	# B
	_say2("Are you gonna stream it?", 0.04)
	yield($"../Dialog", "done")
	# A
	_say1("for sure, my fans cant wait", 0.05)
	yield($"../Dialog", "done")
	# B
	_say2("Haha Bety, you are so mean", 0.04)
	yield($"../Dialog", "done")
	# = pause
	yield(get_tree().create_timer(2), "timeout")
	$"../TimSound".play(0)
	_toggle_door()
	_say1("Oh finally, this elevator is so slow", 0.07)
	yield($"../Dialog", "done")
	# B
	_say2("I know right?", 0.05)
	yield($"../Dialog", "done")
	# = pause
	yield(get_tree().create_timer(5), "timeout")
	# DONE
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

func _say1(text, time):
	$"../Dialog".add_say(text, time, load("res://assets/npc1.wav"))

func _say2(text, time):
	$"../Dialog".add_say(text, time, load("res://assets/npc2.wav"))

func _toggle_door():
	$"../Elevator".toggle_door()
