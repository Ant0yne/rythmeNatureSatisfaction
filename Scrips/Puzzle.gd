extends Node2D

onready var sonsLigne1Et2 = $SonsLigne/SonsLigne1Et2
onready var sonsLigne3Et4 = $SonsLigne/SonsLigne3Et4
onready var sonsLigne5 = $SonsLigne/SonsLigne5
onready var sonsLigne6 = $SonsLigne/SonsLigne6
onready var sonsLigne7 = $SonsLigne/SonsLigne7
onready var sonsLigne8 = $SonsLigne/SonsLigne8
onready var sonsLigne9 = $SonsLigne/SonsLigne9
onready var sonsLigne10 = $SonsLigne/SonsLigne10
onready var test = $Test
onready var puzzleFini = $PuzzleFini
onready var frame_compteur = FrameCompteur
onready var listes = Listes

func _process(delta):
	if frame_compteur.son_piece_pose == true :
		_piece_pose()
		frame_compteur.son_piece_pose = false
	if listes.nbre_bonne_position == listes.puzzle_fini :
		listes.destruction_piece = true
		puzzleFini.visible = true
		
func _piece_pose():
	if frame_compteur.ligne_son == 1:
		sonsLigne1Et2.play()
	if frame_compteur.ligne_son == 2:
		sonsLigne3Et4.play()
	if frame_compteur.ligne_son == 3:
		sonsLigne5.play()
	if frame_compteur.ligne_son == 4:
		sonsLigne6.play()
	if frame_compteur.ligne_son == 5:
		sonsLigne7.play()
	if frame_compteur.ligne_son == 6:
		sonsLigne8.play()
	if frame_compteur.ligne_son == 7:
		sonsLigne9.play()
	if frame_compteur.ligne_son == 8:
		sonsLigne10.play()
	if frame_compteur.ligne_son == 10:
		test.play()
	if frame_compteur.ligne_son == 20:
		test.play()
	if frame_compteur.ligne_son == 30:
		test.play()
	if frame_compteur.ligne_son == 40:
		test.play()
	if frame_compteur.ligne_son == 50:
		test.play()
	if frame_compteur.ligne_son == 60:
		test.play()
	if frame_compteur.ligne_son == 70:
		test.play()
	if frame_compteur.ligne_son == 80:
		test.play()
