extends Node2D

@onready var anim = $Node2D/EarthSprite


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#anim.play('default')
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	anim.play('default')
	pass
	
	
