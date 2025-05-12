extends Node

var score = 0

@onready var score_label = $"../GUI/Panel/ScoreLabel"

func add_point():
	score -= 2
	score_label.text = "Du har totalt " + str(score) + " poäng."
