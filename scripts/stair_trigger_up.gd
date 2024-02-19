extends Area2D

func _ready():
	print("working")

func body_entered(other):
	print("yes")
	var player = other
	print(player)

