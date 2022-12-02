extends Button
signal shopitem3buy


func _on_Item3_pressed():
	print("button3 sent signal")
	emit_signal("shopitem3buy")
	


func _on_Item3_mouse_entered():
	get_node("Label3").show()




func _on_Item3_mouse_exited():
	get_node("Label3").hide()
	



