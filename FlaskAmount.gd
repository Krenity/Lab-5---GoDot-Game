extends Label

signal flaskrecived
var count = 0

func _ready():
	$".".text = str(0)

func _on_Area2D_test():
	count += 1
	emit_signal("flaskrecived")
	$".".text = str(count)
