extends Area2D


func _ready():
	get_node("Panel").hide()
	
func _on_Shop_Detection_ShopNeedsopening():
	get_node("Panel").show()
	pass


func _on_Shop_Detection_ShopNeedsClosing():
	get_node("Panel").hide()
	pass
