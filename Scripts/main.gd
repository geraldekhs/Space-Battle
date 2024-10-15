extends Node
@onready var start_menu=$Control
@onready var intro_dialogue=$IntroDialogue
@onready var stage=$Stage
@onready var mob_timer = $Stage/Spawner/Timer
#declare variable for player
@onready var player=$Stage/Player
#declare variable for Label node in Control Node
@onready var final_score_display = $Control/Label
@onready var score_timer=$Timer

var score = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# this can be done instead of manually setting stage to be invisible
	stage.set_process(false)
	stage.set_physics_process(false)
	stage.visible = true	
	intro_dialogue.visible = false
	
	
	remove_child(stage)
	remove_child(intro_dialogue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# why is player position somewhat non detmeinistic?
func game_over():
	#stops the spawner when game over
	mob_timer.stop()
	#sets player position once game restarts
	player.position = Vector2(400,1080/2)
	start_menu.visible = true
	stage.visible = false
	
	final_score_display.visible = true
	final_score_display.text = 'Score:' + str(score)
	
	score_timer.stop()


func _on_control_start() -> void:
	add_child(intro_dialogue)
	start_menu.visible = false
	intro_dialogue.visible = true

#goes to scene after intro dialogue
func _on_intro_dialogue_start() -> void:
	add_child(stage)
	intro_dialogue.visible = false
	stage.visible = true
