extends Node2D
onready var msl = $ARBRES
onready var player = $player
onready var nuages = $Node2D/nuages
var gcc = get_child_count()
func _physics_process(delta):
	if player != null:
		msl.position.x = player.position.x / 9 - 4
		nuages.position.x = -player.position.x / 4
		gcc = get_child_count()
		if gcc == 4:
			get_tree().change_scene("res://map3.tscn")
	else:
		msl.position.x = 0
