extends Node2D

var bloques = 0
var score = 0
var vidas = 3

@onready var bola = $Bocha
@onready var vidas_label = $CanvasLayer/Vidas

func _ready() -> void:
	bloques = get_tree().get_nodes_in_group("bloques").size()
	$CanvasLayer/Puntuacion.text = "Puntuacion: " + str(score)
	vidas_label.text = "Vidas: " + str(vidas)

func sumar_puntos(puntos):
	score += puntos
	$CanvasLayer/Puntuacion.text = "Puntuacion: " + str(score)

func restar_bloque() -> void:
	bloques -= 1
	if bloques <= 0:
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

func perder_vida():
	vidas -= 1
	vidas_label.text = "Vidas: " + str(vidas)
	
	if vidas > 0:
		reiniciar_bola()
	else:
		get_tree().paused = true
		$CanvasLayer/Reintentar.visible = true

func reiniciar_bola():
	bola.linear_velocity = Vector2.ZERO
	bola.position = Vector2(436,598)
	bola.linear_velocity = Vector2(250, -250)
