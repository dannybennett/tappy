extends Node

signal onGameOver
signal onScoreUpdated

const GROUP_PLANE:String = "plane"

var gameScene: PackedScene = preload("res://game/game.tscn")
var mainScene: PackedScene = preload("res://main/main.tscn")

var _score: int = 0
var _high_score: int = 0


func getScore() -> int:
	return _score

func getHighScore() -> int:
	return _high_score

func setScore(val: int) -> void:
	_score = val
	if _score > _high_score:
		_high_score = _score
	
	print("sc: %s, hs: %s" % [ _score, _high_score])
	onScoreUpdated.emit()
	
func incrementScore() -> void:
	setScore(_score+1)

func loadGameScene() -> void:
	get_tree().change_scene_to_packed(gameScene)


func loadMainScene() -> void:
	get_tree().change_scene_to_packed(mainScene)
