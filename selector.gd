extends Control
onready var planet = $AnimatedSprite
var num = 0 


func _process(delta):
	planet.frame = num 
	
	
	
	
	
	

func _on_TextureButton_pressed():
	if num > 0:
		num -= 1


func _on_TextureButton2_pressed():
	if num < 4:
		num += 1


func _on_select_pressed():
	if num == 0:
		get_tree().change_scene("res://GrassLand.tscn")
	elif num == 1:
		get_tree().change_scene("res://SandLand.tscn")
	elif num == 2:
		pass
	elif num == 3:
		pass 
