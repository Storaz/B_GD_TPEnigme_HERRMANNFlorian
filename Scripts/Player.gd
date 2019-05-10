extends KinematicBody2D

const up = Vector2(0,-1)
const gravity = 20
const speed = 200
const jump = -400

var motion = Vector2()

func _physics_process(_delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_d"):
		motion.x= speed
		$AnimatedSprite.flip_h= false
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("ui_q"):
		motion.x= -speed
		$AnimatedSprite.flip_h= true
		$AnimatedSprite.play("Run")
	else:
		motion.x= 0
		$AnimatedSprite.play("Idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_z"):
			motion.y= jump
	else:
			$AnimatedSprite.play("Jump")
	
	motion = move_and_slide(motion,up)
	
	if Input.is_action_just_pressed("ui_echap"):
		get_tree().change_scene("res://Menu.tscn")
	pass
