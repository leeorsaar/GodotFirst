extends Area2D

const KEY_UP = "player_up"
const KEY_DOWN = "player_down"
const KEY_LEFT = "player_left"
const KEY_RIGHT = "player_right"

@export var m_speed = 400
var m_screenSize
signal s_playerHit

func start(pos : Vector2):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _ready():
	m_screenSize = get_viewport_rect().size
	hide()

func _process(delta):
	#Input reading
	var velocity = Vector2.ZERO
	if Input.is_action_pressed(KEY_UP):
		velocity.y -= 1
	if Input.is_action_pressed(KEY_DOWN):
		velocity.y += 1
	if Input.is_action_pressed(KEY_LEFT):
		velocity.x -= 1
	if Input.is_action_pressed(KEY_RIGHT):
		velocity.x += 1
		
	$PlayerAnimation.SetAnimationFromVelocity(velocity)
	
	#update position
	velocity = velocity.normalized() * m_speed * delta
	position += velocity.clamp(-position, m_screenSize - position)


func _on_body_entered(body):
	hide()
	s_playerHit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
