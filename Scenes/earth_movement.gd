extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(-3.0)
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
