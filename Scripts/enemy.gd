extends RigidBody2D

var big_asteroid = preload('res://Assets/Asteroids/big-b.png')
var med_asteroid = preload('res://Assets/Asteroids/med-b.png')
var texture_array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_array = [big_asteroid, med_asteroid];
	$Sprite2D.texture = texture_array[randi_range(0,1)];
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	#transfer spwaner gd here, use _process to modify direction of enemy


#queues node to be deleted at end of current frame
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.
