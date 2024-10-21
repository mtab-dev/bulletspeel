extends Node

@onready var app: HTTPRequest = $HTTPRequest
@export var clientFeedback: String
@export var rating: String

var url = "https://bullet-rating-e4a2d5156cb5.herokuapp.com/new"
var headers = ["Content-Type: application/json"]
var data = {
	"feedback": clientFeedback,
	"rate": rating
}
var json_data = JSON.stringify(data)

func _ready():
	pass

func requestApi():
	var response = app.request(url, headers,HTTPClient.METHOD_POST, json_data)

func _process(delta):
	pass

func _on_go_ahead_pressed():
	requestApi()

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	print(result)
	print(response_code)
	print(body)
	get_tree().quit()
