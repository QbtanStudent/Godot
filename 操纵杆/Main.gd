extends Node2D


onready var joystick = $Joystick

func _process(_delta):
	$KinematicBody2D.move_and_slide(joystick.get_now_pos() * 200)

func _input(_event):
	#if event is InputEventScreenTouch and event.is_pressed():
	#	joystick.visible = true
	#	joystick.position = event.position
	#	#位置为点击的位置
	#if event is InputEventScreenTouch and !event.is_pressed():
	#	joystick.visible = false
	#	#松手隐藏
	#	joystick.position = event.position
		#位置
	pass
