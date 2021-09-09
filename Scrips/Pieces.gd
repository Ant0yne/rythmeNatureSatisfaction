extends KinematicBody2D

const PieceEffetBonnePos = preload("res://Scenes/PieceEffetBonnePos.tscn")

onready var area_2d_coll_haut = get_node("Haut/CollisionShape2D")
onready var area_2d_coll_bas = get_node("Bas/CollisionShape2D")
onready var area_2d_coll_gauche = get_node("Gauche/CollisionShape2D")
onready var area_2d_coll_droite = get_node("Droite/CollisionShape2D")
onready var sprite = get_node("Sprite")
onready var frame_compteur = FrameCompteur
onready var listes = Listes

#var index_piece_bas = int(10)
#var index_piece_haut = int(10)
#var index_piece_droite = int(1)
#var index_piece_gauche = int(1)
#var piece_bas = bool(false)
#var piece_haut = bool(false)
#var piece_droite = bool(false)
#var piece_gauche = bool(false)

var dragging = bool(false)
var origine_espace_puzzle_x = int(575)
var origine_espace_puzzle_y = int(16)
var limite_espace_puzzle_x = int(1261)
var limite_espace_puzzle_y = int(702)
var taille_piece = int(68)
var rayon_piece = int(34)
var position_piece_cible
var origine_zone_pop_x = int(30)
var origine_zone_pop_y = int(200)
var limite_zone_pop_x = int(540)
var limite_zone_pop_y = int(700)
var en_bonne_position = bool(false)
var piece_prise = bool(false)

signal dragsignal;

func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	area_2d_coll_haut.disabled = true
	area_2d_coll_bas.disabled = true
	area_2d_coll_gauche.disabled = true
	area_2d_coll_droite.disabled = true
	sprite.frame = frame_compteur.frame_compteur
	en_bonne_position = false
	
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
		if event.button_index == BUTTON_LEFT and event.pressed and piece_prise == false and listes.piece_prise == 0:
			listes.piece_prise += 1
			piece_prise = true
#			area_2d_coll_haut.disabled = false
#			area_2d_coll_bas.disabled = false
#			area_2d_coll_gauche.disabled = false
#			area_2d_coll_droite.disabled = false
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed and piece_prise == true:
			emit_signal("dragsignal")
			if self.position.x >= origine_espace_puzzle_x and self.position.x <= limite_espace_puzzle_x and self.position.y >= origine_espace_puzzle_y and self.position.y <= limite_espace_puzzle_y:
#				if piece_bas == false:
					frame_compteur.son_piece_pose = true
#					area_2d_coll_haut.disabled = true
#					area_2d_coll_bas.disabled = true
#					area_2d_coll_gauche.disabled = true
#					area_2d_coll_droite.disabled = true
					var position_x = (self.position.x - origine_espace_puzzle_x)/taille_piece
					var position_x_tronque = int(position_x)
					self.position.x = (position_x_tronque*taille_piece)+rayon_piece + origine_espace_puzzle_x
					var position_y = (self.position.y - origine_espace_puzzle_y)/taille_piece
					var position_y_tronque = int(position_y)
					self.position.y = (position_y_tronque*taille_piece)+rayon_piece + origine_espace_puzzle_y
					_check_position_finale()
					piece_prise = false
					listes.piece_prise = 0
#				if piece_bas == true :
#					frame_compteur.son_piece_pose = true
#					emit_signal("dragsignal")
#					area_2d_coll_haut.disabled = true
#					area_2d_coll_bas.disabled = true
#					area_2d_coll_gauche.disabled = true
#					area_2d_coll_droite.disabled = true
#					self.position.x = position_piece_cible.x
#					self.position.y = position_piece_cible.y - 68
#					piece_bas = false
			elif self.position.x > limite_espace_puzzle_x or self.position.x < 0 or self.position.y > limite_espace_puzzle_y or self.position.y < origine_espace_puzzle_y:
#				area_2d_coll_haut.disabled = true
#				area_2d_coll_bas.disabled = true
#				area_2d_coll_gauche.disabled = true
#				area_2d_coll_droite.disabled = true
				self.position = Vector2(rand_range(origine_zone_pop_x, limite_zone_pop_x), rand_range(origine_zone_pop_y, limite_zone_pop_y))
				piece_prise = false
				listes.piece_prise = 0
			else :
				piece_prise = false
				listes.piece_prise = 0
##				if piece_bas == false:
##					area_2d_coll_haut.disabled = true
##					area_2d_coll_bas.disabled = true
##					area_2d_coll_gauche.disabled = true
##					area_2d_coll_droite.disabled = true
#					emit_signal("dragsignal")
##				if piece_bas == true :
##					area_2d_coll_haut.disabled = true
##					area_2d_coll_bas.disabled = true
##					area_2d_coll_gauche.disabled = true
##					area_2d_coll_droite.disabled = true
##					emit_signal("dragsignal")
##					self.position.x = position_piece_cible.x
##					self.position.y = position_piece_cible.y - 68
##					piece_bas = false

func _check_position_finale() :
	var self_index_liste = int(listes.liste_piece.find(self.get_name(),0))
	var self_index_position = int(listes.liste_positons.find(self.position, 0))
	print("index piece : ", self_index_liste)
	print("index position piece : ", self_index_position)
	if self_index_liste == self_index_position and en_bonne_position == false :
		listes.nbre_bonne_position +=1
		en_bonne_position = true
		_creation_effet_bonne_pos()
#		print("nombre piece bien place :", listes.nbre_bonne_position)
#		print(en_bonne_position)
		if self_index_position >= 0 and self_index_position <= 19:
			frame_compteur.ligne_son = 10
		elif self_index_position >= 20 and self_index_position <= 39:
			frame_compteur.ligne_son = 20
		elif self_index_position >= 40 and self_index_position <= 49:
			frame_compteur.ligne_son = 30
		elif self_index_position >= 50 and self_index_position <= 59:
			frame_compteur.ligne_son = 40
		elif self_index_position >= 60 and self_index_position <= 69:
			frame_compteur.ligne_son = 50
		elif self_index_position >= 70 and self_index_position <= 79:
			frame_compteur.ligne_son = 60
		elif self_index_position >= 80 and self_index_position <= 89:
			frame_compteur.ligne_son = 70
		elif self_index_position >= 90 and self_index_position <= 99:
			frame_compteur.ligne_son = 80
	if self_index_liste != self_index_position and en_bonne_position == true :
		listes.nbre_bonne_position -=1
		en_bonne_position = false
		print("nombre piece bien place :", listes.nbre_bonne_position)
		print(en_bonne_position)

	if self_index_liste != self_index_position and en_bonne_position == false :
		if self_index_position >= 0 and self_index_position <= 19:
			frame_compteur.ligne_son = 1
		elif self_index_position >= 20 and self_index_position <= 39:
			frame_compteur.ligne_son = 2
		elif self_index_position >= 40 and self_index_position <= 49:
			frame_compteur.ligne_son = 3
		elif self_index_position >= 50 and self_index_position <= 59:
			frame_compteur.ligne_son = 4
		elif self_index_position >= 60 and self_index_position <= 69:
			frame_compteur.ligne_son = 5
		elif self_index_position >= 70 and self_index_position <= 79:
			frame_compteur.ligne_son = 6
		elif self_index_position >= 80 and self_index_position <= 99:
			frame_compteur.ligne_son = 7

func _creation_effet_bonne_pos():
	var pieceEffetBonnePos = PieceEffetBonnePos.instance()
	add_child(pieceEffetBonnePos)
	pieceEffetBonnePos.global_position = global_position
	
#func _on_Droite_area_entered(body):
#	if body != self:
#		var self_index_liste = int(liste_piece.find(self.get_name(), 0))
#		var piece_index_liste = int(liste_piece.find(body.get_parent().get_name(), 0))
##		print("moi : ", self_index_liste, "l'autre : ", piece_index_liste)
#		if piece_index_liste == (self_index_liste + index_piece_droite) :
#			print("Collage à droite")
#
#func _on_Haut_area_entered(body):
#	if body != self:
#		var self_index_liste = int(liste_piece.find(self.get_name(), 0))
#		var piece_index_liste = int(liste_piece.find(body.get_parent().get_name(), 0))
##		print("moi : ", self_index_liste, "l'autre : ", piece_index_liste)
#		if piece_index_liste == (self_index_liste - index_piece_haut) :
#			print("Collage en haut")
#
#func _on_Gauche_area_entered(body):
#	if body != self:
#		var self_index_liste = int(liste_piece.find(self.get_name(), 0))
#		var piece_index_liste = int(liste_piece.find(body.get_parent().get_name(), 0))
##		print("moi : ", self_index_liste, "l'autre : ", piece_index_liste)
#		if piece_index_liste == (self_index_liste - index_piece_gauche) :
#			print("Collage à gauche")
#
#func _on_Bas_area_entered(body):
#	if body != self:
#		var self_index_liste = int(liste_piece.find(self.get_name(), 0))
#		var piece_index_liste = int(liste_piece.find(body.get_parent().get_name(), 0))
#		position_piece_cible = body.get_parent().position
##		print("moi : ", self_index_liste, "l'autre : ", piece_index_liste)
#		if piece_index_liste == (self_index_liste + index_piece_bas) :
#			print("Collage en bas")
#			piece_bas = true
