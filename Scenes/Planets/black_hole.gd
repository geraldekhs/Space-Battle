extends Node2D

@onready var anim = $BlackHoleSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play('default')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#move_local_x(-2.0)
	pass

 #Replace with function body.
