extends Panel

@onready var name_label = find_child("Control/Name")
@onready var age_label = find_child("Control/AgeLabel")
@onready var location_label = find_child("Control/LocationLabel")

func update_info(data):
	name_label.text = "Name: " + data.name
	age_label.text = "Age: " + str(data.age)
	location_label.text = "Location: " + data.location
