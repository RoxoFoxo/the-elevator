extends Control

signal done

func _ready():
	add_say("Lorem Ipsum has been the industry's standard dummy text ever " +
	"since the 1500s, when an unknown printer took a galley of type and " +
	"scrambled it to make a type specimen book.", 0.05)
	next_say()

# [[string, time, sound], ...]
var queue = []

func add_say(string, time):
	queue.append([string, time])

func next_say():
	var sound_next = false
	
	$Label.text = ""
	if queue.size() > 0:
		var q = queue.pop_front()
		var string = String(q[0])
		var time = q[1]
		
		for x in string:
			yield(get_tree().create_timer(time), "timeout")
			$Label.text += x
			if sound_next:
				$AudioStreamPlayer.play(0)
				sound_next = false
			else:
				sound_next = true

	else:
		emit_signal("done")

#
# Utils
#

func show():
	$Label.text = ""
	$Label.show()

func hide():
	$Label.hide()
