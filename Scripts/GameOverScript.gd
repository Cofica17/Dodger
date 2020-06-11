extends Node2D

var score : Label
var highScore : Label

func _ready():
	score = get_node("ScoreAchieved")
	highScore = get_node("Highscore")
	
	if Score.score > Score.highscore:
		saveHighScore()
	
	score.text = "Score: " + str(Score.score)
	highScore.text = "Highscore: " + str(Score.highscore)
	
	Score.score = 0

func saveHighScore():
	Score.highscore = Score.score
	var highscoreJsonFormat = { "highscore" : Score.highscore }
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(highscoreJsonFormat))
	save_game.close()

func _on_BackToMainScreenButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenuScene.tscn")


func _on_PlayAgainButton_pressed():
	get_tree().change_scene("res://Scenes/GameScene.tscn")
