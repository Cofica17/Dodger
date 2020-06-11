extends Node2D

onready var singleplayerButton = get_node("SingleplayerButton")
onready var multiplayerButton = get_node("MultiplayerButton")
onready var backToMainScreenButton = get_node("BackToMainScreenButton")

func _ready():
	pass
	

func _on_SingleplayerButton_pressed():
	get_tree().change_scene("res://Scenes/GameScene.tscn")

func _on_MultiplayerButton_pressed():
	pass

func _on_BackToMainScreenButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenuScene.tscn")
