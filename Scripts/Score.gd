extends Node

var score
var highscore 

func _ready():
	score = 0
	highscore = 0
	loadHighscore()

func loadHighscore():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		highscore = parse_json(save_game.get_line()).highscore
	
	save_game.close()
