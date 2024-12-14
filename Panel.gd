extends Panel

@onready var name_label = get_node("../Name")
@onready var age_label = get_node("../AgeLabel")
@onready var location_label = get_node("../LocationLabel")

func update_info(data):
	name_label.text = "Name: " + data.name
	age_label.text = "Age: " + str(data.age)
	location_label.text = "Location: " + data.location
