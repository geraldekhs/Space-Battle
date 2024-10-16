extends Path2D
#references enemy scene
@export var enemy_scene:PackedScene
@onready var spawn_location=$PathFollow2D
@onready var mob_timer=$Timer


var asteroid_spawn_delay = 0
var asteroid_field_delay = 0
var asteroids_stop = 0
#var asteroid_spawn_delay = 2
#var asteroid_field_delay = 13
#var asteroids_stop = 23
var spawn_rate = 0
signal goto_stage2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RichTextLabel2.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_timer_timeout() -> void:
	#mob_timer+=1

	asteroid_spawn_delay+=1
	asteroid_field_delay+=1
	asteroids_stop+=1
	
	
	#
	#
	#asteroid_spawn_delay-=1
	#asteroid_field_delay-=1
	#asteroids_stop-=1
	#
	#asteroids stop spawning after certain period of time
	if asteroid_spawn_delay>2:
		spawn_rate = 2;
	if asteroid_field_delay>14:
		$RichTextLabel2.visible = true
		$AudioStreamPlayer.play()
	if asteroid_field_delay>23:
		$RichTextLabel2.visible = false
		spawn_rate = 15;
		$AudioStreamPlayer.stop()
	if asteroids_stop>30:
		spawn_rate=0
		goto_stage2.emit()
		#emit_signal('goto_stage2')
		#print('yes')
		


	for i in range(spawn_rate):
		var enemy = enemy_scene.instantiate()
		#sets spawn location to a random point 0 to 1.0 on a path eg. spawns on 0.01% dist on a path
		var scale_factor = randf_range(0.1, 1.5)  # Adjust scale range as needed

		spawn_location.progress_ratio = randf()
		#sets actual enemy position
		enemy.position=spawn_location.position
		
		# Set enemy size (scale)
		enemy.scale = Vector2(scale_factor, scale_factor)  # Uniform scaling
		
		#sets direction that enemy is facing when it spawns
		# Randomize spawn direction
		var direction = spawn_location.rotation + randf_range(-PI, PI)
		
		#print(direction)           
		
		enemy.rotation = direction

		# Randomize velocity magnitude and direction
		var velocity_magnitude = randf_range(500, 750)
		var velocity_direction = Vector2(1, 0).rotated(direction + randf_range(-PI/4, PI/4))
		
		enemy.linear_velocity = velocity_direction * velocity_magnitude
		
		var rand_num = randi_range(0,1)
		if rand_num == 0:
			enemy.angular_velocity = velocity_magnitude/30
		else:
			enemy.angular_velocity = 0

		add_child(enemy)
			
	
