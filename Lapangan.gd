extends Node2D

func _ready():
	$Ketangkap.hide()
	$Menang.hide()
	$Ulang.hide()

func _process(_delta):
	if $Pemain.position.y < 340  && $Pemain.tangkap == false :
		$Menang.show()
		$Pemain.hide()

func _on_Ulang_pressed():
	var _ulang = get_tree().reload_current_scene()
