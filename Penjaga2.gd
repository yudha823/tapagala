extends KinematicBody2D

var gerak = Vector2()
var laju = Vector2()
const KECEPATAN_MAKS = 200
const PERCEPATAN = 1000
const REDAMAN = 1000

func _ready():
	gerak = Vector2.ZERO
	

func _physics_process(delta):
	gerak.x = $"../Pemain".position.x - position.x
	gerak.y = 0
	var gerakan = gerak.normalized()
	if gerak.x < -20 || gerak.x > 20 :
		laju +=gerakan*PERCEPATAN*delta
		laju = laju.clamped(KECEPATAN_MAKS)
	else :
		laju = laju.move_toward(Vector2.ZERO, REDAMAN*delta)
		if $"../Pemain".position.y < position.y :
			$AnimatedSprite.play("d_blk")
		else :
			$AnimatedSprite.play("d_dpn")
	var _bergerak = move_and_slide(laju)

	anim()
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Pemain" :
			queue_free()
			$"../Pemain".hide()
			$"../Pemain".tangkap = true
			$"../Menang".show()
			$"../Menang".position = $"../Pemain".position
			$"../Ulang".show()
			$"../Ulang".rect_position = $"../Pemain".position 
			$"../SuaraMenang".play()

func anim():
	if gerak.x > 20 :
		$AnimatedSprite.play("kn")
		$AnimatedSprite.flip_h = false
	if gerak.x < -20 :
		$AnimatedSprite.play("kn")
		$AnimatedSprite.flip_h = true




