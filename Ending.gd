extends Area2D

signal upgradeshide

func _ready():
	get_node("screen").modulate.a = -1
var x = false
func _process(delta):
	if x == true:
		get_node("screen").modulate.a += delta / 2
		if get_node("screen").modulate.a >= 1:
			get_node("screen").modulate.a = 1
	else:
		get_node("screen").modulate.a = -1

func _on_Ending_body_entered(_body):
	x = true
	emit_signal("upgradeshide")
	
