extends Node2D

@onready var anim = $EarthSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play('default')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(-2.0)
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
