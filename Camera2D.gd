extends Camera2D

func _process(_delta):
	position.y = $"../Pemain".position.y - 100
