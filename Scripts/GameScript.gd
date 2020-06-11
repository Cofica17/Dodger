extends Node

var cubeInstance = preload("res://Scenes/Cube.tscn")
var powerCubeInstance = preload("res://Scenes/PowerCube.tscn")
var timer : Timer
var score : Label

func _ready():
	timer = get_node("SpawnTime")
	score = get_node("Score")

func _process(delta):
	keepScore(delta)
	spawnCubes()

func spawnCubes():
	if timer.is_stopped():
		randomize()
		var randomNumberToSpawnPowerCube = int(rand_range(1, 100))
		if randomNumberToSpawnPowerCube <= 5:
			var cube = powerCubeInstance.instance()
			add_child(cube)
			randomize()
			var randomXCoordinate = rand_range(0, get_viewport().size.x)
			cube.rect_position.x = randomXCoordinate
		else:
			var cube = cubeInstance.instance()
			add_child(cube)
			randomize()
			var randomXCoordinate = rand_range(0, get_viewport().size.x)
			cube.rect_position.x = randomXCoordinate
		timer.start()
		Score.score += 1

func keepScore(delta):
	score.text = "Score: " + str(Score.score)

func _on_Player_destroyAllCubes():
	for child in get_children():
		if "Cube" in child.name:
			child.queue_free()
