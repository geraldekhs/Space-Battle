extends Node2D

@onready var main=get_node('/root/Main')
signal start
	
func _ready() -> void:
	$RichTextLabel.visible_ratio = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RichTextLabel.visible_ratio != 1:
		$RichTextLabel.visible_ratio += delta*0.8


func _on_next_button_pressed() -> void:
	start.emit()
