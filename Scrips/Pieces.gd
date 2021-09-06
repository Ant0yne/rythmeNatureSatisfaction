extends KinematicBody2D

var dragging = false

signal dragsignal;

func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	
func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)

func _set_drag_pc():
	dragging = !dragging

func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed :
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			if self.position >= Vector2(576,18) and self.position <= Vector2(1255,696) :
				emit_signal("dragsignal")
#				var division = (self.position.x - 576)/68
#				print(division)
#				var round_division = round(division)
#				print(round_division)
				self.position.x = ((round(self.position.x - 576)/68)*68)+34 + 576
				self.position.y = ((round(self.position.y - 18)/68)*68)+34 + 18
				print("Je suis dans le carre rouge")
			else :
				print("Je suis dehors")
				emit_signal("dragsignal")
