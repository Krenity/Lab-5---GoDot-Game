extends Area2D

func _ready():
	get_node("Panel").hide()
	get_node("Panel2").hide()
	get_node("Panel3").hide()

func _on_Shop_Detection_ShopNeedsopening():
	get_node("Panel").show()
	get_node("Panel2").show()
	get_node("Panel3").show()


func _on_Shop_Detection_ShopNeedsClosing():
	get_node("Panel").hide()
	get_node("Panel2").hide()
	get_node("Panel3").hide()
