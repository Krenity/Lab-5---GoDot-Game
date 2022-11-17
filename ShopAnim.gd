extends Sprite

onready var animation = $AnimationPlayer

func _ready():
	pass
	
func _process(delta):
	animation.play("New Anim")
