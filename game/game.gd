extends Node2D

@export var pipesScene: PackedScene

@onready var pipes_holder = $PipesHolder
@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL
@onready var spawn_timer = $SpawnTimer

@onready var engine_sound = $EngineSound
@onready var game_over_sound = $GameOverSound



# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.setScore(0)
	GameManager.onGameOver.connect(onGameOver)
	spawnPipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawnPipes() -> void:
	var yPos = randf_range(spawn_u.position.y, spawn_l.position.y)
	var newPipes = pipesScene.instantiate()
	newPipes.position = Vector2(spawn_l.position.x, yPos)
	pipes_holder.add_child(newPipes)


func stopPipes() -> void:
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)

func _on_spawn_timer_timeout():
	spawnPipes()


func onGameOver():
	stopPipes()
	engine_sound.stop()
	game_over_sound.play()
	
