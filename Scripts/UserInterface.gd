extends Control

func _process(delta):
	$ViewportContainer/Score.text = "Score: "+str(Globals.SCORE)+" Life: "+str(Globals.LIFE)


func _on_left_pressed():
	Input.action_press("ui_left")


func _on_left_released():
	Input.action_release("ui_left")


func _on_right_pressed():
	Input.action_press("ui_right")


func _on_right_released():
	Input.action_release("ui_right")


func _on_up_pressed():
	Input.action_press("ui_up")


func _on_up_released():
	Input.action_release("ui_up")


func _on_Stop_pressed():
	Globals.reset()
	get_tree().change_scene("res://Scenes/Screens/Home.tscn")


func _on_shoot_pressed():
	Input.action_press("shoot")


func _on_shoot_released():
	Input.action_release("shoot")
