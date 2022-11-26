extends Button

signal shopitem1buy

func _ready():
	get_node("Label").hide()
	
func _on_Item1_pressed():
	print("button1 sent signal")
	emit_signal("shopitem1buy")
	pass


func _on_Item1_mouse_entered():
	get_node("Label").show()


func _on_Item1_mouse_exited():
	get_node("Label").hide()
