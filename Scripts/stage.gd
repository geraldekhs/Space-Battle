extends Node2D

@onready var anim = $Node2D/EarthSprite
#var timing = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#visible = false
	#anim.play('default')
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	anim.play('default')

	#timing-=1
	#
	#if timing<0:
		#visible = true
	pass
	

func _on_timer_timeout() -> void:
	
	pass # Replace with function body.
