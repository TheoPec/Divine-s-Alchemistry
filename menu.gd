extends Control
var cursor_normal = preload("res://Cursors/Cursors2-128.png")
var cursor_click = preload("res://Cursors/Cursors2-128-clicked.png")
func _ready():
	# Curseur par défaut
	Input.set_custom_mouse_cursor(cursor_normal, Input.CURSOR_ARROW, Vector2(16, 16))

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		# Curseur quand on clique
		Input.set_custom_mouse_cursor(cursor_click, Input.CURSOR_ARROW, Vector2(16, 16))
	else:
		# Curseur normal
		Input.set_custom_mouse_cursor(cursor_normal, Input.CURSOR_ARROW, Vector2(16, 16))
