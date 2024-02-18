extends KinematicBody2D

onready var player : KinematicBody2D = $"../player"
onready var anims = $AnimatedSprite
var speed : float =  rand_range(19,50)
var pos = Vector2()
var dead = false
func _physics_process(delta):
	if dead == false:
		anims.play("normal")
	
	if player != null and dead == false:
		# Calculer la direction vers le joueur
		var direction = (player.position - position).normalized()

		# Calculer le déplacement en fonction de la direction et de la vitesse
		var velocity = direction * speed
		
		# Mettre à jour la position en utilisant move_and_slide()
		move_and_slide(velocity)
		move_and_slide(Vector2(0, 50))
		# Ajuster la composante y de la position pour empêcher le slime de voler
		
		







func _on_coeur_area_entered(area):
	if area.is_in_group("sword"):
		dead = true
		anims.stop()
		self.position.y -= 5
		anims.play("dye")



func _on_AnimatedSprite_animation_finished():
	if dead == true:
		self.queue_free()
	
