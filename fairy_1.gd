extends Sprite2D

@export var amplitude: float = 50.0     # Hauteur de l’oscillation
@export var frequency: float = 0.2      # Nombre d’oscillations par seconde
@export var base_y: float = 300.0       # Position centrale

var time := 0.0

func _process(delta):
	time += delta
	var offset = amplitude * sin(2.0 * PI * frequency * time)
	position.y = base_y + offset
