extends KinematicBody2D
var rdm = Vector2(rand_range(-8, 8), rand_range(-8,8))
onready var player : KinematicBody2D = $"../player"
onready var anims = $AnimatedSprite
var speed : float =  rand_range(19,59)
var pos = Vector2()
var dead = false

func _physics_process(delta):
	if dead == false:
		anims.play("bat")
	

	if player != null and dead == false:
		# Calculer la direction vers le joueur
		var direction = (player.position + rdm - position).normalized()

		# Calculer le déplacement en fonction de la direction et de la vitesse
		var velocity = direction * speed

		# Mettre à jour la position en utilisant move_and_slide()
		move_and_slide(velocity)
		if velocity.length_squared() > 0:
			$AnimatedSprite.flip_h = velocity.x < 0






func _on_coeur_area_entered(area):
	if area.is_in_group("sword"):
		dead = true
		anims.stop()
		self.position.y -= 10
		anims.play("dye")



func _on_AnimatedSprite_animation_finished():
	if dead == true:
		self.queue_free()
	
