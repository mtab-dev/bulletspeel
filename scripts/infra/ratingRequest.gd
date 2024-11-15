extends Node

@onready var app: HTTPRequest = $HTTPRequest
@onready var app2: HTTPRequest = $HTTPRequest2
@export var rating: int
@onready var title: Button = $title
@onready var send: Button = $send
@onready var lineText: LineEdit = $LineEdit
@onready var bt1: Button = $Button
@onready var bt2 : Button = $Button2
@onready var bt3: Button = $Button3
@onready var bt4: Button = $Button4
@onready var bt5: Button = $Button5
var clientFeedback: String = "aaaaaaaa"


func _ready():
	if Global.lang == "port":
		title.text = "AVALIA AI PRA NOIS"
		send.text = "ENVIAR"
		lineText.placeholder_text = "Mande um comentário (opcional)"
	if Global.lang == "eng":
		title.text = "GIVE US A RATING"
		send.text = "SEND"
		lineText.placeholder_text = "Write down a feedback (optional)"
	if Global.lang == "esp":
		title.text = "ENVIANOS UNA CALIFICACION"
		send.text = "ENVIAR"
		lineText.placeholder_text = "Escriba un comentario (opcional)"
		
func getColor():
	if Global.playerColor == "B":
		return 2
	if Global.playerColor == "M":
		return 1
	if Global.playerColor == "W":
		return 0

func sendSession():
	var url = "https://fromhel-sessions-e536f7c7bd6c.herokuapp.com/session"
	var headers = ["Content-Type: application/json"]
	var data = {
		"gameName": "bulletspeel",
		"timespent": Global.time,
		"deaths": Global.death,
		"colorPicked": getColor(),
		"enemysKilled": Global.enemiesKilled,
		"gameFinished": true,
		"money": Global.money,
		"ammunation": Global.ammunation,
		"items": true
	}
	var json_data = JSON.stringify(data)
	var response = app.request(url, headers, HTTPClient.METHOD_POST, json_data)

func requestApi():
	var url = "https://fromhel-sessions-e536f7c7bd6c.herokuapp.com/rating"
	var headers = ["Content-Type: application/json"]
	var data = {
		"gameName": "bulletspeel",
		"rating": rating,
		"feedback": clientFeedback
}
	var json_data = JSON.stringify(data)
	var response = app2.request(url, headers,HTTPClient.METHOD_POST, json_data)
	print(response)
	
func fillStars():
	if rating == 0:
		bt1.icon = load("res://sprites/ui/rating/star_empty.webp")
		bt2.icon = load("res://sprites/ui/rating/star_empty.webp")
		bt3.icon = load("res://sprites/ui/rating/star_empty.webp")
		bt4.icon = load("res://sprites/ui/rating/star_empty.webp")
		bt5.icon = load("res://sprites/ui/rating/star_empty.webp")
	if rating == 1:
		bt1.icon = load("res://sprites/ui/rating/star_full.webp")
		bt2.icon = load("res://sprites/ui/rating/star_empty.webp")
		bt3.icon = load("res://sprites/ui/rating/star_empty.webp")
		bt4.icon = load("res://sprites/ui/rating/star_empty.webp")
		bt5.icon = load("res://sprites/ui/rating/star_empty.webp")
	if rating == 2:
		bt1.icon = load("res://sprites/ui/rating/star_full.webp")
		bt2.icon = load("res://sprites/ui/rating/star_full.webp")
		bt3.icon = load("res://sprites/ui/rating/star_empty.webp")
		bt4.icon = load("res://sprites/ui/rating/star_empty.webp")
		bt5.icon = load("res://sprites/ui/rating/star_empty.webp")
	if rating == 3:
		bt1.icon = load("res://sprites/ui/rating/star_full.webp")
		bt2.icon = load("res://sprites/ui/rating/star_full.webp")
		bt3.icon = load("res://sprites/ui/rating/star_full.webp")
		bt4.icon = load("res://sprites/ui/rating/star_empty.webp")
		bt5.icon = load("res://sprites/ui/rating/star_empty.webp")
	if rating == 4:
		bt1.icon = load("res://sprites/ui/rating/star_full.webp")
		bt2.icon = load("res://sprites/ui/rating/star_full.webp")
		bt3.icon = load("res://sprites/ui/rating/star_full.webp")
		bt4.icon = load("res://sprites/ui/rating/star_full.webp")
		bt5.icon = load("res://sprites/ui/rating/star_empty.webp")
	if rating == 5:
		bt1.icon = load("res://sprites/ui/rating/star_full.webp")
		bt2.icon = load("res://sprites/ui/rating/star_full.webp")
		bt3.icon = load("res://sprites/ui/rating/star_full.webp")
		bt4.icon = load("res://sprites/ui/rating/star_full.webp")
		bt5.icon = load("res://sprites/ui/rating/star_full.webp")

func _process(delta: float) -> void:
	fillStars()

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	get_tree().change_scene_to_file("res://scenes/ui/betaEnd.tscn")

func _on_send_pressed() -> void:
	sendSession()
	requestApi()


func _on_line_edit_text_changed(new_text: String) -> void:
	clientFeedback = new_text


func _on_button_pressed() -> void:
	if rating == 1:
		rating = 0
	rating = 1

func _on_button_2_pressed() -> void:
	rating = 2

func _on_button_3_pressed() -> void:
	rating = 3

func _on_button_4_pressed() -> void:
	rating = 4

func _on_button_5_pressed() -> void:
	rating = 5

func _on_line_edit_text_submitted(new_text: String) -> void:
	sendSession()
	requestApi()
