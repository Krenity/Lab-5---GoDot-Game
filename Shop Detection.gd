extends Area2D

signal ShopNeedsopening
signal ShopNeedsClosing

func _on_Shop_Detection_body_entered(_body):
	emit_signal("ShopNeedsopening")
	pass


func _on_Shop_Detection_body_exited(_body):
	emit_signal("ShopNeedsClosing")
	pass
