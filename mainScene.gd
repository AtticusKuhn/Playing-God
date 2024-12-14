extends Node2D

@onready var info_panel = $UI/InfoPanel
@onready var prayer_panel = $UI/PrayerPanel

func _ready():
	for person in $People.get_children():
		print(person)
		person.person_clicked.connect(self._on_person_clicked)
		
		#person.connect("person_clicked", self, "_on_person_clicked")
		#person.connect("prayer_sent", self._on_prayer_sent)
	info_panel.hide()
	prayer_panel.hide()

func _on_person_clicked(person_data):
	info_panel.show()
	prayer_panel.show()
	info_panel.update_info(person_data)
	prayer_panel.update_prayer(person_data.prayer)

func _on_prayer_sent(person_data):
	# Show prayer notification or update UI
	prayer_panel.show()
	prayer_panel.update_prayer(person_data.prayer)
