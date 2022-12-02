extends KinematicBody2D
const maxjump = -400
var jumpheight = -50
var isinwindRight = false
var isinwindLeft = false
var jumping = false
var windspeed = 1.05
var count = 0
var cheats = false
var bouncemax = 1
var gravityoff = false
onready var animation = $AnimationPlayer
var playerdirection = 0
var x = 1
var fallen = false
const gravity = 9
const maxgravity = 1000
const playerspeed = 150
const UP = Vector2(0, -1)
var motion = Vector2()
func _ready():
	get_node("ChargeBar").hide()


func _physics_process(_delta):
	
	
	
	#CHEATS ENABLE/DISABLE
	
	
	
	print(jumpheight, motion, count, cheats)
	if Input.is_action_just_pressed("cheatsenable"):
		cheats = true
		$CollisionPolygon2D.disabled = true
	if cheats == true:
		if Input.is_action_just_pressed("cheatsdisable"):
			cheats = false
			$CollisionPolygon2D.disabled = false
		motion.x = 0
		motion.y = 0
		if Input.is_action_pressed("flyup"):
			motion.y = -300
		if Input.is_action_just_released("flyup"):
			motion.y = 0
		if Input.is_action_pressed("flydown"):
			motion.y = 300
		if Input.is_action_just_released("flydown"):
			motion.y = 0
		if Input.is_action_pressed("flyleft"):
			motion.x = -300
		if Input.is_action_just_released("flyleft"):
			motion.x = 0
		if Input.is_action_pressed("flyright"):
			motion.x = 300
		if Input.is_action_just_released("flyright"):
			motion.x = 0
		else:
			motion = move_and_slide(motion, UP)
			
			
			#GRAVITY + WIND + MATH
			
			
	if cheats == false:
		if isinwindRight == true:
			motion.x += 5
			if motion.x > playerspeed*windspeed:
				motion.x = playerspeed*windspeed
		if isinwindLeft == true:
			motion.x += -5
			if motion.x > -playerspeed*windspeed:
				motion.x = -playerspeed*windspeed
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
				$hit.play()
				motion.x = playerspeed / 1.2
				motion.y = -200
				bouncemax = 0
				fallen = true
				$land.stop()
			if is_on_wall() and playerdirection == 1 and bouncemax == 1:
				$hit.play()
				motion.x = -playerspeed / 1.2
				motion.y = -200
				bouncemax = 0
				fallen = true
				$land.stop()
		if fallen == true and is_on_floor():
			$land.play()
		if not is_on_floor():
			print("true")
			Input.action_release("move_right")
			Input.action_release("move_down")
			Input.action_release("move_left")
		if gravityoff == false:
			motion.y += gravity
			if motion.y > maxgravity:
				motion.y = maxgravity
				
				
				#JUMPING
				
				
		if is_on_floor():
			if Input.is_action_pressed("move_down"):
				while x == 1:
					$ChargeBar.texture = preload("res://Assets/Images/JumpPower/1.png")
					x = 0
				jumpheight += -5 
				if jumpheight == -230:
					$ChargeBar.texture = preload("res://Assets/Images/JumpPower/2.png")
				if jumpheight == maxjump:
					$ChargeBar.texture = preload("res://Assets/Images/JumpPower/3.png")
			if Input.is_action_just_released("move_down"):
				x = 1
				$ChargeBar.texture = preload("res://Assets/Images/JumpPower/0.png")
				$Jump.play()
				if jumpheight < maxjump:
					motion.y = maxjump
					jumpheight = -100
				else:
					motion.y = jumpheight
					jumpheight = -100
					
					
					#MOVEMENT
					
					
		if Input.is_action_pressed("move_right"):
			if is_on_floor():
				$Sprite.flip_h = false
				animation.play("Run")
			motion.x = playerspeed 
			if Input.is_action_pressed("move_down"):
				animation.play("Jump")
				motion.x = 0
		elif Input.is_action_pressed("move_left"):
			if is_on_floor():
				$Sprite.flip_h = true
				animation.play("Run")
			motion.x = -playerspeed 
			if Input.is_action_pressed("move_down"):
				animation.play("Jump")
				motion.x = 0
				
				
			#MOVEMENT MATH	
				
				
		else:
			if is_on_ceiling():
				motion.y = 5
			if is_on_floor() and jumping == false:
				if is_on_floor():
					fallen = false
					animation.play("Idle")
				motion.x = 0
				bouncemax = 1
			jumping = false
		motion = move_and_slide(motion, UP)
		Engine.time_scale = 3


#SHOP SYSTEM/UPGRADE


func _on_Label_flaskrecived():
	count += 1
	$Flask.play()

signal item1bought 
func _on_Item1_shopitem1buy():
	if count >= 10:
		$Label.text = str(count - 10)
		count = count - 10
		emit_signal("item1bought")
		get_node("ChargeBar").show()


func _on_Item2_shopitem2buy():
	if count >= 50:
		$Label.text = str(count - 50)


func _on_Ending_upgradeshide():
	Input.action_press("cheatsenable")
	get_node("ChargeBar").hide()


func _on_Tractor_beam_Tractorbeamactivate():
	motion.y = -30
	motion.x = -10
	gravityoff = true


func _on_Tractor_beam_Tractorbeamdeactivate():
	gravityoff = false
	motion.x = -50


func _on_WindDetection_body_entered(_body):
	isinwindRight = true


func _on_WindDetection_body_exited(_body):
	isinwindRight = false
