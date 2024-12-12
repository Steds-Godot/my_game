extends Camera2D

@onready var player: CharacterBody2D = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = player.global_position
	update_limits()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = player.global_position
	
func update_limits() -> void:
	limit_left = 0
	limit_top = 0
	limit_right = 1152
	limit_bottom = 368
	pass
