extends Node

@onready var app: HTTPRequest = $HTTPRequest
@export var rating: int
@onready var title: Button = $title
@onready var send: Button = $send
@onready var lineText: LineEdit = $LineEdit
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
		title.text = "ENVÍANOS UNA CALIFICACIÓN"
		send.text = "ENVIAR"
		lineText.placeholder_text = "Escriba un comentario (opcional)"

func requestApi():
	var url = "https://bullet-rating-e4a2d5156cb5.herokuapp.com/api/feedback/new"
	var headers = ["Content-Type: application/json"]
	var data = {
		"rate": rating,
		"feedback": clientFeedback
	}
	var json_data = JSON.stringify(data)
	var response = app.request(url, headers,HTTPClient.METHOD_POST, json_data)

func _process(delta):
	pass

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	get_tree().change_scene_to_file("res://scenes/ui/betaEnd.tscn")


func _on_send_pressed() -> void:
	requestApi()


func _on_line_edit_text_changed(new_text: String) -> void:
	clientFeedback = new_text


func _on_button_pressed() -> void:
	rating = 1


func _on_button_2_pressed() -> void:
	rating = 3


func _on_button_3_pressed() -> void:
	rating = 2


func _on_line_edit_text_submitted(new_text: String) -> void:
	requestApi()
