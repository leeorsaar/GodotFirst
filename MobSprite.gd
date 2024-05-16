extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = sprite_frames.get_animation_names()
	play(mob_types[randi_range(0, mob_types.size() - 1)])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
