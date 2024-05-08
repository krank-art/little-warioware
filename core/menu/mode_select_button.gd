extends Button

@export var mode_definition: Resource


func _on_pressed():
	Session.start_mode(mode_definition)
