extends Panel


func _ready():
	pass
	
	
	
func _process(delta):
	pass


func _on_Start_pressed():
	get_tree().change_scene("res://Main.tscn")
	pass


func _on_Help_pressed():
	get_tree().change_scene("res://HelpMenue.tscn")
	pass
