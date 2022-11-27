extends Area2D

signal Tractorbeamactivate
signal Tractorbeamdeactivate

func _on_Tractor_beam_body_entered(_body):
	emit_signal("Tractorbeamactivate")


func _on_Tractor_beam_body_exited(body):
	emit_signal("Tractorbeamdeactivate")
