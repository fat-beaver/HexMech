extends Node2D

func _ready():
	var label = Label.new()
	label.set_text("Hello world!")
	add_child(label)
	var camera = Camera2D.new()
	add_child(camera)
	#set the camera as the current one so it is actually used
	camera.make_current()

func _process(_delta):
	pass
