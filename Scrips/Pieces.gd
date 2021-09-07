extends KinematicBody2D

var dragging = bool(false)
var origine_espace_puzzle_x = int(576)
var origine_espace_puzzle_y = int(18)
var taille_piece = int(68)
var rayon_piece = int(34)

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

				var position_x = (self.position.x - origine_espace_puzzle_x)/taille_piece
				var position_x_tronque = int(position_x)
				self.position.x = (position_x_tronque*taille_piece)+rayon_piece + origine_espace_puzzle_x
				var position_y = (self.position.y - origine_espace_puzzle_y)/taille_piece
				var position_y_tronque = int(position_y)
				self.position.y = (position_y_tronque*taille_piece)+rayon_piece + origine_espace_puzzle_y

				print("Je suis dans le carre rouge")
			else :
				print("Je suis dehors")
				emit_signal("dragsignal")
