extends Button

signal shopitem2buy

func _ready():
	get_node("Label2").hide()

func _on_Item2_pressed():
	print("button2 sent signal")
	emit_signal("shopitem2buy")
	pass

func _on_Item2_mouse_entered():
	get_node("Label2").show()
	pass

func _on_Item2_mouse_exited():
	get_node("Label2").hide()
	pass
