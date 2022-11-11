extends KinematicBody2D

var LowJump = preload("res://Assets/Images/LowJump.png")
var MediumJump = preload("res://Assets/Images/MediumJump.png")
var HighJump = preload("res://Assets/Images/HighJump.png")
const UP = Vector2(0, -1)
const speed = 230
const gravity = 10
const maxgravity = 720
var direction = Vector2()
func _ready():
	pass
func _physics_process(delta):
	direction.y += gravity
	if direction.y > maxgravity:
		direction.y = maxgravity
	print(direction)
	if Input.is_action_pressed("move_right") and Input.is_action_pressed("move_down"):
		if is_on_floor():
			direction.x = speed
			direction.y += -500
	elif Input.is_action_pressed("move_left") and Input.is_action_pressed("move_down"):
		if is_on_floor():
			direction.x = -speed
			direction.y += -500
		
	else:
		if is_on_floor():
			direction.y = 0
		if is_on_ceiling():
			direction.y = 5
		if is_on_floor():
			direction.x = 0
	move_and_slide(direction, UP)
	
