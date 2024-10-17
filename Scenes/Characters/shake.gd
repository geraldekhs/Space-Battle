extends Camera2D

@export var randomStrength: float = 3.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0
#
#func _ready() -> void:
	#set_as_top_level(true)
	
func apply_shake():
	shake_strength = randomStrength

func stop_shake():
	shake_strength = 0

func _process(delta):
	if Globals.in_blackhole == true:
		apply_shake()
		set_as_top_level(false)
		
	else:
		stop_shake()

		
	
	if shake_strength > 0:
		shake_strength = lerp(shake_strength, 0.0, shakeFade * delta)
		offset = randomOffset()

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
