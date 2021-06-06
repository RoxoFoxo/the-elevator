extends Node

# called by MainScene to run the act
export var run = false

# act number, 0 = wait we are on the mid of one
var act = 1

# sends to the MainScene, so it can start another act
signal finished

# move characters
signal move_outside

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# from MainScene
func run():
	run = true

func _process(delta):
	if not run:
		return
	if act == 1:
		act = 0
		_act1()

func _act1():
	print_debug("starting act 2 p/ 1")
	yield(get_tree().create_timer(8), "timeout")
	_say1("Oh you are finally here...", 0.04)
	yield($"../Dialog", "done")
	_say1("but unfortunately...", 0.05)
	yield($"../Dialog", "done")
	_say1("the game is over...", 0.06)
	yield($"../Dialog", "done")
	# = pause
	yield(get_tree().create_timer(20), "timeout")
	_say1("Im serious, the game is over...", 0.06)
	yield($"../Dialog", "done")
	_say1("our dev team dont had much more time to work", 0.06)
	yield($"../Dialog", "done")
	_say1("so yea, this is the end", 0.06)
	yield($"../Dialog", "done")
	yield(get_tree().create_timer(30), "timeout")
	_say1("Why this elevator music never ends?", 0.06)
	yield($"../Dialog", "done")
	yield(get_tree().create_timer(60), "timeout")
	_say1("You can exit now, you know?", 0.06)
	yield($"../Dialog", "done")
	yield(get_tree().create_timer(60), "timeout")
	_say1("Are you sure that you want to lost your time here?", 0.06)
	yield($"../Dialog", "done")
	yield(get_tree().create_timer(200), "timeout")
	_say1("What a crazy ***", 0.05)
	yield($"../Dialog", "done")
	yield(get_tree().create_timer(500), "timeout")
	_say1("ok, do whatever you want", 0.05)
	yield($"../Dialog", "done")
	yield(get_tree().create_timer(500), "timeout")
	_say1("yet here? my god...", 0.07)
	yield($"../Dialog", "done")
	yield(get_tree().create_timer(5000), "timeout")
	_say1("????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????", 0.07)
	yield($"../Dialog", "done")

func _say1(text, time):
	$"../Dialog".add_say(text, time, load("res://assets/npc3.wav"))
