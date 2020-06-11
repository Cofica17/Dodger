extends ColorRect

var fallingSpeed = 70

func _ready():
	randomize()
	fallingSpeed = rand_range(10,130) 

func _process(delta):
	if !Global.switchDirection:
		rect_position.y += fallingSpeed * delta
	else:
		rect_position.y -= fallingSpeed * delta
	
	if rect_position.y + rect_size.y > get_parent().rect_size.y:
		queue_free()
