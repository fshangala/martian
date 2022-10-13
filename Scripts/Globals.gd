extends Node

var LIFE = 5
var SCORE = 0
var DIRECTION = 1
var PLAYER_POSITION = Vector2.ZERO

func reset():
	LIFE=5
	SCORE=0

func goHome():
	get_tree().change_scene("res://Scenes/Screens/Home.tscn")
