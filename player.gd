extends KinematicBody2D
onready var lifescore = $TextureProgress
onready var anims = $AnimatedSprite
var isdye = false
var is_tuable = true
var mouvement = Vector2()
var up = Vector2(0, -1)
var speed = 20
var dernier = 1
var gravity = 200
var jump_velocity = -197  
var isAttacking = false
var ppvs = global.player_pvs
func _ready():
	$Area2D/CollisionShape2D.disabled = true
func _process(delta):
	
	
	if ppvs < 1:
		isdye = true
		if dernier == 0:
			$AnimatedSprite.play("dye droite")
		if dernier == 1:
			$AnimatedSprite.play("dye gauche")
	
	mouvement.x = 0
	lifescore.value = ppvs
	$vie.text = str(ppvs)
	if isdye == false:
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("d") and not isAttacking:
			mouvement.x = speed
			anims.flip_h = false
			anims.play("walk")
			dernier = 0
		elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("a") and not isAttacking:
			mouvement.x = -speed
			anims.play("walk")
			anims.flip_h = true
			dernier = 1
		else:
			anims.stop()
			anims.frame = 1

	# Gestion de l'attaque
		if Input.is_action_just_pressed("souris"):
			$Area2D/CollisionShape2D.disabled = false
			if dernier == 0:
				$AnimationPlayer.play("slash droite")
			elif dernier == 1:
				$AnimationPlayer.play("slash gauche")
		if is_on_floor():
			if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("w") or Input.is_action_just_pressed("space"):
				mouvement.y = jump_velocity
		if mouvement.y > 0:
			if not is_on_floor():
				if is_on_wall():
					if Input.is_action_pressed("ui_up") or Input.is_action_pressed("w") or Input.is_action_pressed("space"):
						mouvement.y = 1
	mouvement.y += gravity * delta
	mouvement = move_and_slide(mouvement, up)

	
	if Input.is_action_pressed("ui_down") or Input.is_action_pressed("s"):
		gravity = 690
	else:
		gravity = 400
	if not is_on_floor():
		speed = 85
	else:
		speed = 90
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "slash droite" or "slash gauche":
		isAttacking = false
		$Area2D/CollisionShape2D.disabled = true
	if anim_name == "blink":
		is_tuable = true
	
	


func _on_coeur_area_entered(area):
	if isdye != true:
		$AnimationPlayer.play("blink")
		is_tuable = false
		if area.is_in_group("slime"):
			ppvs -= 5
			
		if area.is_in_group("bat"):
			ppvs -= 2
			

func _on_AnimatedSprite_animation_finished():
	if isdye == true:
		hide()
