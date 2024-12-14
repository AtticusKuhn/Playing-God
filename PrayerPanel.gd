extends Panel

@onready var prayer_label =  get_node("../PrayerLabel")
@onready var respond_button = get_node("../RespondButton")
@onready var response_dropdown = get_node("../ResponseDropdown")

var current_prayer = ""
var response_options = ["Bless you", "Grant your wish", "Provide guidance", "Remain silent"]

func update_prayer(prayer_text):
	current_prayer = prayer_text
	prayer_label.text = "Prayer: " + prayer_text
	response_dropdown.clear()
	response_dropdown.add_item("Select Response")
	for option in response_options:
		response_dropdown.add_item(option)
	response_dropdown.selected = 0

func _ready():

	respond_button.connect("pressed", self._on_respond_pressed)
	# Populate dropdown
	for option in response_options:
		response_dropdown.add_item(option)

func _on_respond_pressed():
	var selected_index = response_dropdown.selected
	if selected_index > 0:
		var response = response_dropdown.get_item_text(selected_index)
		# Implement response effect, e.g., log or modify person_data
		print("Responded with: " + response)
		# Hide panels after response
		hide()
