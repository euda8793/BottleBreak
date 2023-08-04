extends Node3D

@onready var gimbal_x := $Gimbal_X as Node3D
@onready var cam := $Gimbal_X/Camera3D as Camera3D

@export var speed := 2.0

func _process(delta):
	var direction = Input.get_vector("ui_up", "ui_down", "ui_left", "ui_right")
	rotate_y(direction.y * delta * speed)
	gimbal_x.rotate_x(direction.x * delta * speed)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 4:
			cam.position += Vector3.FORWARD
		if event.button_index == 5:
			cam.position -= Vector3.FORWARD
	
