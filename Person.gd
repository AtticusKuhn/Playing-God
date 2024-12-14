extends Area2D

signal person_clicked(person_data)
signal prayer_sent(person_data)

var person_data = {
	"name": "John Doe",
	"age": 30,
	"location": "New York",
	"prayer": "Hope for good health",
	"has_prayed": false
}

func _ready():
	connect("input_event", self._on_input_event)
	# Start a timer to simulate prayers
	var prayer_timer = Timer.new()
	prayer_timer.wait_time = randf_range(10, 30) # Random interval
	prayer_timer.one_shot = false
	prayer_timer.autostart = true
	prayer_timer.connect("timeout", self._send_prayer)
	add_child(prayer_timer)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("person_clicked", person_data)

func _send_prayer():
	if not person_data.has_prayed:
		emit_signal("prayer_sent", person_data)
		person_data.has_prayed = true
		# Optionally reset after some time
		var reset_timer = Timer.new()
		reset_timer.wait_time = 10
		reset_timer.one_shot = true
		reset_timer.connect("timeout", self._reset_prayer)
		add_child(reset_timer)
		
func _reset_prayer():
	person_data.has_prayed = false
