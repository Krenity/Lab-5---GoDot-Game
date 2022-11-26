extends Sprite

onready var animation = $Area2D/AnimationPlayer

func _ready():
	pass
	
func _process(_delta):
	animation.play("New Anim")
