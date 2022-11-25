extends Area2D

signal ShopNeedsopening
signal ShopNeedsClosing

func _on_Shop_Detection_body_entered(body):
	emit_signal("ShopNeedsopening")
	pass


func _on_Shop_Detection_body_exited(body):
	emit_signal("ShopNeedsClosing")
	pass
