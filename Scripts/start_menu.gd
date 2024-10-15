#Starts the game from the main screen
extends Control

# defers initialization of a member variable until _ready() is called
# gets the "Main" node
@onready var main=get_node('/root/Main')
signal start

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false
	$RichTextLabel.visible_ratio = 0.0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RichTextLabel.visible_ratio != 1:
		$RichTextLabel.visible_ratio += delta*0.8
		#
#func _on_button_pressed() -> void:
	#start.emit()
	#pass # Replace with function body.
	#

func _on_play_button_pressed() -> void:
	print('pressed')
	start.emit()
	
func _on_credits_button_pressed() -> void:
	#go to credits page lol
	pass
	
	
