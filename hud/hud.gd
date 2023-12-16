extends Control

@onready var score_label = $MC/ScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.onScoreUpdated.connect(onScoreUpdated)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func onScoreUpdated() -> void:
	score_label.text = str(GameManager.getScore())
