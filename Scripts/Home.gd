extends Control


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Screens/Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()
