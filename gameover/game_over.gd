extends Control

@onready var game_over_label = $GameOverLabel
@onready var press_space_label = $PressSpaceLabel
@onready var timer = $Timer

var canPressSpace: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.onGameOver.connect(onGameOver)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if canPressSpace == true:
		if Input.is_action_just_pressed("fly") == true:
			GameManager.loadMainScene()
			

func onGameOver()->void:
	show()
	timer.start()
	
func runSequence()->void:
	game_over_label.hide()
	press_space_label.show()
	canPressSpace = true
	
func _on_timer_timeout():
	runSequence()
