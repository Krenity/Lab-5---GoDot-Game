extends Sprite



onready var animation = $AnimationPlayer


func _ready():
	pass


func _process(delta):
	if Input.is_action_pressed("move_right"):
		animation.play("PressD")
	else:
		animation.play("D")
