extends Control

@onready var high_score_label_value = $MC/HBoxContainer/HighScoreLabelValue


# Called when the node enters the scene tree for the first time.
func _ready():
	high_score_label_value.text = str(GameManager.getScore())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fly") == true:
		GameManager.loadGameScene()
 
