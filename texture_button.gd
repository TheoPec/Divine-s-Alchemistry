extends TextureButton


func _on_mouse_entered() -> void:
	$SoundHover.play()


func _on_pressed() -> void:
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Level1.tscn")
