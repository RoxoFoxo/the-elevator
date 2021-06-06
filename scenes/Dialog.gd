extends Control

signal done

# process only one say each time thought process
var next = true

# [[string, time, sound], ...]
var queue = []

func add_say(string, time, audio):
	queue.append([string, time, audio])

func _process(_delta):
	if next:
		next = false
		_next_say()

func _next_say():
	var sound_next = false
	
	$Label.text = ""
	
	if queue.size() > 0:
		var q = queue.pop_front()
		var string = String(q[0])
		var time = q[1]
		$AudioStreamPlayer.stream = q[2]
		
		for x in string:
			yield(get_tree().create_timer(time), "timeout")
			$Label.text += x
			if sound_next:
				$AudioStreamPlayer.play(0)
				sound_next = false
			else:
				sound_next = true
		yield(get_tree().create_timer(4), "timeout")
		emit_signal("done")
		next = true
	else:
		next = true
		emit_signal("done")

#
# Utils
#

func show():
	$Label.text = ""
	$Label.show()

func hide():
	$Label.hide()
