extends KinematicBody2D
const maxjump = -400
var jumpheight = -50
var jumping = false
var bouncemax = 1
onready var animation = $AnimationPlayer
var playerdirection = 0
const gravity = 9
const maxgravity = 1000
const playerspeed = 150
const UP = Vector2(0, -1)
var motion = Vector2()
func _ready():
	pass



func _physics_process(delta):
	print(jumpheight, motion)
	if Input.is_action_pressed("move_left"):
		playerdirection = 0
		$Sprite.flip_h = true
		animation.play("Run")
	if Input.is_action_pressed("move_right"):
		$Sprite.flip_h = false
		animation.play("Run")
		playerdirection = 1
	if not is_on_floor():
		if is_on_wall() and playerdirection == 0 and bouncemax == 1:
			motion.x = playerspeed
			motion.y = -200
			bouncemax = 0
		if is_on_wall() and playerdirection == 1 and bouncemax == 1:
			motion.x = -playerspeed
			motion.y = -200
			bouncemax = 0
	if not is_on_floor():
		print("true")
		Input.action_release("move_right")
		Input.action_release("move_down")
		Input.action_release("move_left")
	motion.y += gravity
	if motion.y > maxgravity:
		motion.y = maxgravity
	if is_on_floor():
		if Input.is_action_pressed("move_down"):
			animation.play("Jump")
			jumpheight += -5
		if Input.is_action_just_released("move_down"):
			animation.play("Jump")
			if jumpheight < maxjump:
				motion.y = maxjump
				jumpheight = -100
			else:
				motion.y = jumpheight
				animation.play("Jump")
				jumpheight = -100
	if Input.is_action_pressed("move_right"):
		if is_on_floor():
			$Sprite.flip_h = false
			animation.play("Run")
		motion.x = playerspeed 
		if Input.is_action_pressed("move_down"):
			motion.x = 0
	elif Input.is_action_pressed("move_left"):
		if is_on_floor():
			$Sprite.flip_h = true
			animation.play("Run")
		motion.x = -playerspeed 
		if Input.is_action_pressed("move_down"):
			motion.x = 0
			
	else:
		if is_on_ceiling():
			motion.y = 5
		if is_on_floor() and jumping == false:
			if is_on_floor():
				animation.play("Idle")
			motion.x = 0
			bouncemax = 1
		jumping = false
	motion = move_and_slide(motion, UP)
	Engine.time_scale = 3
