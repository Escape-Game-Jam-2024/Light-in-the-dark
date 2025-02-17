extends CharacterBody2D

const speed = 100
var current_dir = "none"

func _ready():
	pass

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		player_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		player_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		player_anim(1)
		velocity.y = speed
		velocity.x = 0	
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		player_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		player_anim(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()	

func player_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	if dir == "right":
		if movement == 1:
			anim.play("right walk")
		elif movement == 0:
			anim.stop();
	if dir == "left":
		if movement == 1:
			anim.play("left walk")
		elif movement == 0:
			anim.stop();
	if dir == "down":
		if movement == 1:
			anim.play("front walk")
		elif movement == 0:
			anim.stop();
	if dir == "up":
		if movement == 1:
			anim.play("back walk")
		elif movement == 0:
			anim.stop();
	
	
