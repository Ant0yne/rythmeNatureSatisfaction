extends Node2D

onready var ecranNoir = $"Ecran noir"
onready var frameCompteur = FrameCompteur
onready var listes = Listes

func _on_Jouer_button_up():
	get_tree().change_scene("res://Scenes/Puzzle.tscn")


func _on_Quitter_button_up():
	get_tree().quit()


func _on_Credit_button_up():
	get_tree().change_scene("res://Scenes/Credit.tscn")
