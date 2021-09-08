extends KinematicBody2D

onready var area_2d_coll_haut = get_node("Haut/CollisionShape2D")
onready var area_2d_coll_bas = get_node("Bas/CollisionShape2D")
onready var area_2d_coll_gauche = get_node("Gauche/CollisionShape2D")
onready var area_2d_coll_droite = get_node("Droite/CollisionShape2D")

var liste_piece = ["Piece", "Piece1", "Piece2", "Piece3", "Piece4", "Piece5", "Piece6", "Piece7", "Piece8", "Piece9", "Piece10", "Piece11", "Piece12"]
var index_piece_bas = int(10)
var index_piece_haut = int(10)
var index_piece_droite = int(1)
var index_piece_gauche = int(1)
var piece_bas = bool(false)
var piece_haut = bool(false)
var piece_droite = bool(false)
var piece_gauche = bool(false)

var dragging = bool(false)
var origine_espace_puzzle_x = int(576)
var origine_espace_puzzle_y = int(18)
var taille_piece = int(68)
var rayon_piece = int(34)
var position_piece_cible

signal dragsignal;

func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	area_2d_coll_haut.disabled = true
	area_2d_coll_bas.disabled = true
	area_2d_coll_gauche.disabled = true
	area_2d_coll_droite.disabled = true
	
func _process(delta):
#	var enfant = get_node("B2")
#	var diff = get_global_position() - enfant.get_global_position()
#	set_global_position(get_global_position() + diff)
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)

func _set_drag_pc():
	dragging = !dragging

func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed :
			area_2d_coll_haut.disabled = false
			area_2d_coll_bas.disabled = false
			area_2d_coll_gauche.disabled = false
			area_2d_coll_droite.disabled = false
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			if self.position >= Vector2(576,18) and self.position <= Vector2(1255,696) :
				if piece_bas == false:
					emit_signal("dragsignal")
					area_2d_coll_haut.disabled = true
					area_2d_coll_bas.disabled = true
					area_2d_coll_gauche.disabled = true
					area_2d_coll_droite.disabled = true
					var position_x = (self.position.x - origine_espace_puzzle_x)/taille_piece
					var position_x_tronque = int(position_x)
					self.position.x = (position_x_tronque*taille_piece)+rayon_piece + origine_espace_puzzle_x
					var position_y = (self.position.y - origine_espace_puzzle_y)/taille_piece
					var position_y_tronque = int(position_y)
					self.position.y = (position_y_tronque*taille_piece)+rayon_piece + origine_espace_puzzle_y
				if piece_bas == true :
					emit_signal("dragsignal")
					area_2d_coll_haut.disabled = true
					area_2d_coll_bas.disabled = true
					area_2d_coll_gauche.disabled = true
					area_2d_coll_droite.disabled = true
					self.position.x = position_piece_cible.x
					self.position.y = position_piece_cible.y - 68
					piece_bas = false
			else :
				if piece_bas == false:
					area_2d_coll_haut.disabled = true
					area_2d_coll_bas.disabled = true
					area_2d_coll_gauche.disabled = true
					area_2d_coll_droite.disabled = true
					emit_signal("dragsignal")
				if piece_bas == true :
					area_2d_coll_haut.disabled = true
					area_2d_coll_bas.disabled = true
					area_2d_coll_gauche.disabled = true
					area_2d_coll_droite.disabled = true
					emit_signal("dragsignal")
					self.position.x = position_piece_cible.x
					self.position.y = position_piece_cible.y - 68
					piece_bas = false


func _on_Droite_area_entered(body):
	if body != self:
		var self_index_liste = int(liste_piece.find(self.get_name(), 0))
		var piece_index_liste = int(liste_piece.find(body.get_parent().get_name(), 0))
		print("moi : ", self_index_liste, "l'autre : ", piece_index_liste)
		if piece_index_liste == (self_index_liste + index_piece_droite) :
			print("Collage à droite")


func _on_Haut_area_entered(body):
	if body != self:
		var self_index_liste = int(liste_piece.find(self.get_name(), 0))
		var piece_index_liste = int(liste_piece.find(body.get_parent().get_name(), 0))
		print("moi : ", self_index_liste, "l'autre : ", piece_index_liste)
		if piece_index_liste == (self_index_liste - index_piece_haut) :
			print("Collage en haut")


func _on_Gauche_area_entered(body):
	if body != self:
		var self_index_liste = int(liste_piece.find(self.get_name(), 0))
		var piece_index_liste = int(liste_piece.find(body.get_parent().get_name(), 0))
		print("moi : ", self_index_liste, "l'autre : ", piece_index_liste)
		if piece_index_liste == (self_index_liste - index_piece_gauche) :
			print("Collage à gauche")

func _on_Bas_area_entered(body):
	if body != self:
		var self_index_liste = int(liste_piece.find(self.get_name(), 0))
		var piece_index_liste = int(liste_piece.find(body.get_parent().get_name(), 0))
		position_piece_cible = body.get_parent().position
		print("moi : ", self_index_liste, "l'autre : ", piece_index_liste)
		if piece_index_liste == (self_index_liste + index_piece_bas) :
			print("Collage en bas")
			piece_bas = true
