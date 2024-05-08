extends Node
# Manage high scores

signal high_scores_cleared

var high_scores: Dictionary


func _ready() -> void:
	load_scores()


func save_score_for(mode_name: String, score: int) -> void:
	if !high_scores.has(mode_name):
		high_scores[mode_name] = 0

	if score > high_scores[mode_name]:
		high_scores[mode_name] = score

	save_scores()


func load_scores() -> void:
	# TODO: Fix reading from old Godot v3.x DAT file when expecting Godot v4.x DAT file
	if not FileAccess.file_exists("user://save_score.dat"):
		return
	var file := FileAccess.open("user://save_score.dat", FileAccess.READ)
	high_scores = file.get_var()
	file.close()


func save_scores() -> void:
	var file := FileAccess.open("user://save_score.dat", FileAccess.WRITE)
	file.store_var(high_scores, true)
	file.close()


func clear_scores() -> void:
	high_scores = {}
	save_scores()

	emit_signal("high_scores_cleared")
