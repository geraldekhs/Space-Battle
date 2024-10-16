extends CharacterBody2D
#gets main node when scene starts
@onready var main = get_node("/root/Main")
@onready var anim = $AnimatedPlayerSprite
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var timer = 0
var inside_area = false
var explosion = false
var explosion_played = false

# Flag to track if default animation has played
var default_animation_played = false
#var velo = 0.0;
signal velo(velocity_x)

var slow = false
var slow_factor = 1

# Called when node is added to scene tree
func _ready() -> void:
	pass

# Called every physics frame (usually used for physics-related code)
func _physics_process(delta: float) -> void:
	
	if explosion == false:
		anim.play('moving')
	
	if slow:
		slow_factor = 0.2
	else:
		slow_factor = 1.0
	
	var direction_x := Input.get_axis("Left", "Right")
	var direction_y := Input.get_axis("Up", "Down")

	#if there is an input, move in that direction at a certain speed
	#else, set speed to 0
	if direction_x or direction_y:
		velocity.x = direction_x * SPEED
		velocity.y = direction_y * SPEED
		
		if velocity.length()>0:
			velocity = velocity.normalized() * SPEED * 2.5 * slow_factor
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	velo.emit(velocity.x)
	
	if inside_area:
		timer += delta  # Increment by the delta time
	else:
		timer = 0  # Reset the timer if not inside the area
		
	if timer > 4.0:
		explosion = true
	#
	#if timer > 5.0 and not explosion:
		#print('exp')
		#anim.stop()
		#anim.play('explosion')
		#explosion_played = true  # Ensure the explosion plays once
		
	move_and_slide()
	
#on collision, set game over
func _on_area_2d_body_entered(body: Node2D) -> void:	
	#makes object disappear
	#visible = false
	#$AnimatedSprite2D.set_visible(randi_range(0,1))
	#quits the game
	#get_tree().quit()
	$AudioStreamPlayer.play()
	#main.game_over()
	#if explosion:
		#anim.play('explosion')
	$AnimatedPlayerSprite.modulate = Color.RED;
	await get_tree().create_timer(0.1).timeout
	$AnimatedPlayerSprite.modulate = Color.WHITE;
	

	
func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print(body_rid)
	if '4664334483457' in str(body_rid):
		slow = true
	inside_area = true
#func _on_area_2d_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	#if '4561255268353' in str(body_rid):
		#slow = false


func _on_timer_timeout() -> void:
	if timer>4.0 and not explosion_played:
		anim.play('explosion')
		explosion_played=true
	


		
