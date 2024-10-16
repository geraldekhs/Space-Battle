extends Node2D

@onready var goto_signal=$spawner
#$Spawner

func _ready() -> void:
	#print(goto_signal)
	#$spawner.visible = true
	#upon receiving signal goto_stage2 from spawner.gd, run start_stage2
	#visible = false
	#anim.play('default')
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	goto_signal.connect("goto_stage2",start_stage2)

	pass

func _on_timer_timeout() -> void:
	pass # Replace with function body.
#
func start_stage2() -> void:
	print('yes')
	$BlackHole2DNode.visible = true
	#$Black
	pass
