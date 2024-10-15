extends CharacterBody2D
#gets main node when scene starts
@onready var main = get_node("/root/Main")
@onready var anim = $AnimatedPlayerSprite
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Flag to track if default animation has played
var default_animation_played = false


# Called when node is added to scene tree
func _ready() -> void:

	pass

# Called every physics frame (usually used for physics-related code)
func _physics_process(delta: float) -> void:
	anim.play('moving')

#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction_x := Input.get_axis("Left", "Right")
	
	var direction_y := Input.get_axis("Up", "Down")

	#if there is an input, move in that direction at a certain speed
	#else, set speed to 0
	if direction_x or direction_y:
		velocity.x = direction_x * SPEED
		velocity.y = direction_y * SPEED

		
		#print(velocity)
		
		if velocity.length()>0:
			velocity = velocity.normalized() * SPEED * 2.5
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
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
	
	$AnimatedPlayerSprite.modulate = Color.RED;
	await get_tree().create_timer(0.1).timeout
	$AnimatedPlayerSprite.modulate = Color.WHITE;

#
#func _on_animated_player_sprite_animation_finished() -> void:
	#anim.play('moving')
