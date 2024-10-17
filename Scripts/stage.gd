extends Node2D
@onready var mob_timer=$Timer
@onready var blackhole=$BlackHole2DNode
var timer = 0
var timer2 = 0

func _ready() -> void:
	remove_child(blackhole)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
func _on_timer_timeout() -> void:
	#remove_child(blackhole)

	timer+=1
	timer2+=1
	#if timer>3:
	if timer>30:
		add_child(blackhole)
		blackhole.visible=true
		


func _on_player_velo(velocity_x: Variant) -> void:
		
	
	if get_node_or_null("BlackHole2DNode"):
		if $BlackHole2DNode.visible == true:
			#if timer>3:
			if timer>30:
				$BlackHole2DNode.move_local_x(-4)
				$player.move_local_x(1)
			#
		#if timer >10:
			#$BlackHole2DNode.move_local_x(-velocity_x/50)
			#
	#print(timer)
	

			
