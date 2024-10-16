extends Node

@onready var start_menu=$start_menu
@onready var intro_dialogue=$intro_dialogue
@onready var stage1=$stage1
@onready var mob_timer = $stage1/Spawner/Timer
@onready var player=$stage1/Player
@onready var final_score_display = $start_menu/Label
@onready var score_timer=$Timer
@onready var stage2=$stage2


#prepare to connect to goto_stage2 signal
@onready var goto_signal=$stage1/Spawner

var score = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	# this can be done instead of manually setting stage to be invisible
	stage1.set_process(false)
	stage1.set_physics_process(false)
	stage1.visible = true	
	intro_dialogue.visible = false
	#upon receiving signal goto_stage2 from spawner.gd, run start_stage2
	#goto_signal.connect('goto_stage2',start_stage2)
	
	remove_child(stage1)
	remove_child(intro_dialogue)
	remove_child(stage2)


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
	stage1.visible = false
	
	final_score_display.visible = true
	final_score_display.text = 'Score:' + str(score)
	
	score_timer.stop()


func _on_control_start() -> void:
	add_child(intro_dialogue)
	start_menu.visible = false
	intro_dialogue.visible = true


#goes to scene after intro dialogue
func _on_intro_dialogue_start() -> void:
	add_child(stage1)
	intro_dialogue.visible = false
	stage1.visible = true
	
#func start_stage2() -> void:
	#add_child(stage2)
	#stage1.visible = false
	#stage2.visible = true
