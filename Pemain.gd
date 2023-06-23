extends KinematicBody2D

var gerak = Vector2()
var laju = Vector2()
const KECEPATAN_MAKS = 250
const PERCEPATAN = 1000
const REDAMAN = 1000
var tangkap = false

func _ready():
	gerak = Vector2.ZERO
	

func _physics_process(delta):
	gerak.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	gerak.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var gerakan = gerak.normalized()
	if gerak != Vector2.ZERO && tangkap == false:
		laju +=gerakan*PERCEPATAN*delta
		laju = laju.clamped(KECEPATAN_MAKS)
	else :
		laju = laju.move_toward(Vector2.ZERO, REDAMAN*delta)
		$AnimatedSprite.play("diam")
	var _bergerak = move_and_slide(laju)
	anim_gerak()
	
	print(gerak)
func anim_gerak():
	match gerak :
		Vector2(0,-1):
			$AnimatedSprite.play("blk")
		Vector2(1,-1):
			$AnimatedSprite.play("sa")
			$AnimatedSprite.flip_h = false
		Vector2(1,0):
			$AnimatedSprite.play("kn")
			$AnimatedSprite.flip_h = false
		Vector2(0,-1):
			$AnimatedSprite.play("blk")
		Vector2(1,1):
			$AnimatedSprite.play("sb")
			$AnimatedSprite.flip_h = false
		Vector2(0,1):
			$AnimatedSprite.play("dpn")
		Vector2(-1,-1):
			$AnimatedSprite.play("sa")
			$AnimatedSprite.flip_h = true
		Vector2(-1,0):
			$AnimatedSprite.play("kn")
			$AnimatedSprite.flip_h = true
		Vector2(-1,1):
			$AnimatedSprite.play("sb")
			$AnimatedSprite.flip_h = true


