extends Control

func _ready():
	$Score.text = "Score: " + str(Globals.SCORE)

func _on_Restart_pressed():
	Globals.reset()
	get_tree().change_scene("res://Scenes/Screens/Game.tscn")


func _on_Button_pressed():
	Globals.reset()
	get_tree().change_scene("res://Scenes/Screens/Home.tscn")
