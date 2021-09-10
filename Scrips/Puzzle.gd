extends Node2D

onready var sonsLigne1Et2 = $SonsLigne/SonsLigne1Et2
onready var sonsLigne3Et4 = $SonsLigne/SonsLigne3Et4
onready var sonsLigne5 = $SonsLigne/SonsLigne5
onready var sonsLigne6 = $SonsLigne/SonsLigne6
onready var sonsLigne7 = $SonsLigne/SonsLigne7
onready var sonsLigne8 = $SonsLigne/SonsLigne8
onready var sonsLigne9Et10 = $SonsLigne/SonsLigne9Et10
onready var bruitPiece = $BruitPiece
onready var mixingDesk = $MixingDeskMusic
onready var bouclesGuitareIntro = $"MixingDeskMusic/Boucles/CoreContainer/Boucles Guitare Intro"
onready var bouclesGuitare = $"MixingDeskMusic/Boucles/CoreContainer/Boucles Guitare"
onready var bouclesMelodie = $"MixingDeskMusic/Boucles/CoreContainer/Boucles Melodie"
onready var bouclesAccord = $"MixingDeskMusic/Boucles/CoreContainer/Boucles Accord"
onready var bouclesBasse = $"MixingDeskMusic/Boucles/CoreContainer/Boucles Basse"
onready var bouclesHihat = $"MixingDeskMusic/Boucles/CoreContainer/Boucles Hihat"
onready var bouclesRimshot = $"MixingDeskMusic/Boucles/CoreContainer/Boucles Rimshot"
onready var bouclesKick = $"MixingDeskMusic/Boucles/CoreContainer/Boucles Kick"


onready var test = $Test
onready var puzzleFini = $PuzzleFini
onready var frame_compteur = FrameCompteur
onready var listes = Listes
onready var ecranNoir = $"Ecran noir"

var delay = int(0)
var monte_son = int(-80)
var guitare_max = bool(false)
var melodie_max = bool(false)
var accord_max = bool(false)
var basse_max = bool(false)
var hihat_max = bool(false)
var rimshot_max = bool(false)
var kick_max = bool(false)

func _ready():
	bouclesGuitareIntro.play(0)
	bouclesGuitare.play(0)
	bouclesMelodie.play(0)
	bouclesAccord.play(0)
	bouclesBasse.play(0)
	bouclesHihat.play(0)
	bouclesRimshot.play(0)
	bouclesKick.play(0)
	bouclesGuitareIntro.set_volume_db(-80)
	bouclesGuitare.set_volume_db(-80)
	bouclesMelodie.set_volume_db(-80)
	bouclesAccord.set_volume_db(-80)
	bouclesBasse.set_volume_db(-80)
	bouclesHihat.set_volume_db(-80)
	bouclesRimshot.set_volume_db(-80)
	bouclesKick.set_volume_db(-80)


func _process(delta):
	if frame_compteur.son_piece_pose == true :
		_piece_pose()
		_boucle_joue()
		frame_compteur.son_piece_pose = false
	if listes.nbre_bonne_position == listes.puzzle_fini :
		listes.destruction_piece = true
		puzzleFini.visible = true
		frame_compteur.restart_puzzle_fini = true
		delay += 1
		if delay > 80:
			if ecranNoir.modulate.a < 1 :
				ecranNoir.modulate.a += 0.01
			if ecranNoir.modulate.a >= 1 :
				get_tree().quit()
	
	if frame_compteur.boucle_guitare_joue == true and guitare_max == false:
		if bouclesGuitare.volume_db < 0:
			monte_son += 1
			bouclesGuitare.set_volume_db(monte_son)
		if bouclesGuitare.volume_db >= 0:
			monte_son = -80
			guitare_max = true
	if frame_compteur.boucle_melodie_joue == true and melodie_max == false:
		if bouclesMelodie.volume_db < 0:
			monte_son += 1
			bouclesMelodie.set_volume_db(monte_son)
		if bouclesMelodie.volume_db >= 0:
			monte_son = -80
			melodie_max = true
	if frame_compteur.boucle_accord_joue == true and accord_max == false:
		if bouclesAccord.volume_db < 0:
			monte_son += 1
			bouclesAccord.set_volume_db(monte_son)
		if bouclesAccord.volume_db >= 0:
			monte_son = -80
			accord_max = true
	if frame_compteur.boucle_basse_joue == true and basse_max == false:
		if bouclesBasse.volume_db < 0:
			monte_son += 1
			bouclesBasse.set_volume_db(monte_son)
		if bouclesBasse.volume_db >= 0:
			monte_son = -80
			basse_max = true
	if frame_compteur.boucle_hihat_joue == true and hihat_max == false:
		if bouclesHihat.volume_db < 0:
			monte_son += 1
			bouclesHihat.set_volume_db(monte_son)
		if bouclesHihat.volume_db >= 0:
			monte_son = -80
			hihat_max = true
	if frame_compteur.boucle_rimshot_joue == true and rimshot_max == false:
		if bouclesRimshot.volume_db < 0:
			monte_son += 1
			bouclesRimshot.set_volume_db(monte_son)
		if bouclesRimshot.volume_db >= 0:
			monte_son = -80
			rimshot_max = true
	if frame_compteur.boucle_kick_joue == true and kick_max == false:
		if bouclesKick.volume_db < 0:
			monte_son += 1
			bouclesKick.set_volume_db(monte_son)
		if bouclesKick.volume_db >= 0:
			monte_son = -80
			kick_max = true


func _input(event):
	if event.is_action_released("ui_cancel"):
		get_tree().change_scene("res://Scenes/Menu.tscn")

func _piece_pose():
	if frame_compteur.ligne_son == 1:
		sonsLigne1Et2.play()
		bruitPiece.play()
	if frame_compteur.ligne_son == 2:
		sonsLigne3Et4.play()
		bruitPiece.play()
	if frame_compteur.ligne_son == 3:
		sonsLigne5.play()
		bruitPiece.play()
	if frame_compteur.ligne_son == 4:
		sonsLigne6.play()
		bruitPiece.play()
	if frame_compteur.ligne_son == 5:
		sonsLigne7.play()
		bruitPiece.play()
	if frame_compteur.ligne_son == 6:
		sonsLigne8.play()
		bruitPiece.play()
	if frame_compteur.ligne_son == 7:
		sonsLigne9Et10.play()
		bruitPiece.play()
	if frame_compteur.ligne_son == 10:
		sonsLigne1Et2.play()
		test.play()
	if frame_compteur.ligne_son == 20:
		sonsLigne3Et4.play()
		test.play()
	if frame_compteur.ligne_son == 30:
		sonsLigne5.play()
		test.play()
	if frame_compteur.ligne_son == 40:
		sonsLigne6.play()
		test.play()
	if frame_compteur.ligne_son == 50:
		sonsLigne7.play()
		test.play()
	if frame_compteur.ligne_son == 60:
		sonsLigne8.play()
		test.play()
	if frame_compteur.ligne_son == 70:
		sonsLigne9Et10.play()
		test.play()

func _boucle_joue():
	if frame_compteur.boucle_guitare >= 7 and frame_compteur.boucle_guitare_joue == false :
		frame_compteur.boucle_guitare_joue = true
	if frame_compteur.boucle_melodie >= 7 and frame_compteur.boucle_melodie_joue == false :
		frame_compteur.boucle_melodie_joue = true
	if frame_compteur.boucle_accord >= 7 and frame_compteur.boucle_accord_joue == false :
		frame_compteur.boucle_accord_joue = true
	if frame_compteur.boucle_basse >= 7 and frame_compteur.boucle_basse_joue == false :
		frame_compteur.boucle_basse_joue = true
	if frame_compteur.boucle_hihat >= 7 and frame_compteur.boucle_hihat_joue == false :
		frame_compteur.boucle_hihat_joue = true
	if frame_compteur.boucle_rimshot >= 7 and frame_compteur.boucle_rimshot_joue == false :
		frame_compteur.boucle_rimshot_joue = true
	if frame_compteur.boucle_kick >= 7 and frame_compteur.boucle_kick_joue == false :
		frame_compteur.boucle_kick_joue = true
