extends Sprite



onready var animation = $AnimationPlayer


func _ready():
	pass


func _process(_delta):
	if Input.is_action_pressed("move_down"):
		animation.play("PressS")
	else:
		animation.play("S")
