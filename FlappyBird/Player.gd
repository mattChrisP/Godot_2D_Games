extends KinematicBody2D
signal hit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const UP = Vector2(0, -1)
const FLAP = 300
const MAXFALLSPEED = 250
var GRAVITY = 20

var idle = true

var motion = Vector2()
var Wall = preload("res://Wallnode.tscn")
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):

	if not idle:
	
		motion.y += GRAVITY
		if motion.y > MAXFALLSPEED:
			motion.y = MAXFALLSPEED
		if Input.is_action_just_pressed("flap"):
			motion.y = -FLAP 
		if motion.y >200:
			rotation = 0.4
		else:
			rotation = -0.2
		motion = move_and_slide(motion, UP)
		get_parent().get_parent().get_node("CanvasLayer/ScoreLabel").text = str(score)
	
	





func _on_Detect_area_entered(area):
	if area.name == "PointArea":
		score += 1


func _on_Detect_body_entered(body):
	if body.name == "Walls":
		idle = true
		$Music.stop()
		position = Vector2(0, 0)
		$CollisionShape2D.set_deferred("disabled", true)
		emit_signal("hit")
		hide()
		
	
		
		
		
func startPlayer():
	$Music.play()
	idle = false
	$CollisionShape2D.disabled = false
	score = 0
	show()

	
