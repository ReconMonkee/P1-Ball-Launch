extends RigidBody2D

export var strength : float = 0
export var launchAngleX : float = 0
export var launchAngleY : float = 0

export var maxAngle : float = 180
export var minAngle : int = 0

func angleCheck():
	print(launchAngleY)

func strengthCheck():
	print(strength)

func _process(delta):
	if Input.is_action_pressed("angle_up"):
		if launchAngleY > maxAngle:
			launchAngleY = maxAngle
		launchAngleY += 5 
		angleCheck()
	if Input.is_action_pressed("angle_down"):
		if launchAngleY < minAngle:
			launchAngleY = minAngle
		launchAngleY -= 5
		angleCheck()
	
	if Input.is_action_pressed("strength_increase"):
		strength += 5
		strengthCheck()
	if Input.is_action_pressed("strength_decrease"):
		strength -= 5
		strengthCheck()
	
	if Input.is_action_just_pressed("launch"):
		var direction = Vector2(1, -launchAngleY).normalized()
		var velocity = direction * strength
		apply_impulse(Vector2.ZERO, velocity)
		strengthCheck()
		angleCheck()
		print(launchAngleX)
