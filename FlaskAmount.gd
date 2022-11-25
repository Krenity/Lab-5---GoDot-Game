extends Label

var count = 0

func _on_Area2D_test():
	count += 1
	$".".text = str(count)
	pass
