extends AnimatedSprite2D

const ANIMATION_WALK = "Walk"
const ANIMATION_UP = "Up"

func SetAnimationFromVelocity(velocity : Vector2) -> void:
	var playAnimation : bool = false
	if(velocity.x != 0):
		playAnimation = true
		if(velocity.y == 0):
			animation = ANIMATION_WALK
		flip_h = velocity.x < 0
	if(velocity.y != 0):
		playAnimation = true
		animation = ANIMATION_UP
		flip_v = velocity.y > 0
	if(playAnimation):
		play()
	else:
		stop()
