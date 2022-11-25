extends Area2D

signal test

func _on_Area2D_body_entered(body):
	queue_free()
	emit_signal("test")
	pass
