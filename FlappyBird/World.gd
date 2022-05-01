extends Node2D
export(PackedScene) var wallScene


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_WallTimer_timeout():
	
	
	var wall = wallScene.instance()
	wall.position  =  Vector2(500, rand_range(150, -150) )
	
	
	
	add_child(wall)



func _on_Button_pressed():
	$WallTimer.start()
	$CanvasLayer/StartButton.hide()
	$PlayerNode/Player.startPlayer()
	
	
func game_over():
	$WallTimer.stop()
	$CanvasLayer/StartButton.show()
	$DeathSound.play()
	
	






