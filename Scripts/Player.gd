extends Node2D

var joystickVector
var screensize
export var speed = 250
signal destroyAllCubes

var timer : Timer = Timer.new()

func _ready():
	screensize = get_parent().get_rect().size - Vector2(0,8)
	timer.wait_time = 1.5
	timer.connect("timeout", self, "timerTimedOut")
	add_child(timer)

func _process(delta):
	move(delta)

	if position.x == 0:
		position.x = get_parent().get_rect().size.x - 1
		
	if position.x == get_parent().get_rect().size.x:
		position.x = 1

func move(delta):
	var velocity = Vector2()
	var nextPosition = position

	if joystickVector and joystickVector.length() != 0:
		velocity += joystickVector
	if velocity.length() > 0:
		velocity = velocity * speed
	
	nextPosition += velocity * delta
	nextPosition.x = clamp(nextPosition.x, 0, screensize.x)
	nextPosition.y = clamp(nextPosition.y, 0, screensize.y)

	position = nextPosition

func _on_JoyStick_move(vector):
	joystickVector = vector

func _on_Area2D_area_entered(area):
	if "PointsUp" in area.get_parent().name:
		Score.score += 100
	elif "SwitchGravity" in area.get_parent().name:
		Global.switchDirection = true
		timer.start()
	elif "DestroyAllCube" in area.get_parent().name:
		emit_signal("destroyAllCubes")
	elif "Cube" in area.get_parent().name:
		get_tree().change_scene("res://Scenes/GameOverScene.tscn")

func timerTimedOut():
	Global.switchDirection = false
