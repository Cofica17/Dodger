extends "res://Scripts/Cube.gd"

var powerCubeType

func _ready():
	randomize()
	powerCubeType = int(rand_range(1, 4))
	setPowerType()

func setPowerType():
	if powerCubeType == 1:
		color = "#00ff00"
		name = "PointsUpCube"
	elif powerCubeType == 2:
		color = "#ff0000"
		name = "SwitchGravityCube"
	elif powerCubeType == 3:
		color = "#00ff00"
		name = "DestroyAllCube"

func _on_Area2D_area_entered(area):
	if area.get_parent().name == "Player":
		queue_free()
