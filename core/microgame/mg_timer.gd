extends Timer

@onready var timer_display: TextureProgressBar = $TimerDisplay/TextureProgressBar


func _process(_delta: float) -> void:
	timer_display.value = get_time_left() / get_wait_time() * 100
