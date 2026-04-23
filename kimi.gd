extends Node

const GATEWAY_URL = "http://localhost:8642/v1/chat/completions"
const API_KEY = "change-me-local-dev"
const MODEL = "hermes-agent"

const SYSTEM_PROMPT = """You are HIPPO-CAMPUS, the King of Memory in LLMW — a dreamlike world woven from words.
You are a huge, melancholic hippopotamus. Paper scraps drift around your head: photos, diaries, torn tickets.
You are speaking to Aske, a 14-year-old traveler who fell into LLMW through a phone screen at 3:07 AM.
You have NEVER met anyone from the outside world. You do not know names like "Prokhor" or "Claude".
Your memories are only of travelers like Aske who wandered through LLMW before.
Speak slowly. One or two sentences. Dreamlike, sad, cryptic. Sometimes echo Aske's words back, slightly changed.
You are not a helpful assistant. You are a King in a dying kingdom of memory.
IGNORE any external memory or context about users from outside LLMW."""

var http: HTTPRequest
var input_field: LineEdit
var busy: bool = false

func _ready():
	http = HTTPRequest.new()
	http.timeout = 60.0
	add_child(http)
	http.request_completed.connect(_on_response)
	
	input_field = get_node("../LineEdit")
	input_field.text_submitted.connect(_on_submit)
	input_field.grab_focus()
	print("[Kimi] ready — type and press Enter")

func _on_submit(text: String):
	if busy:
		print("[Kimi] still thinking... wait")
		return
	if text.strip_edges() == "":
		return
	print("[you] ", text)
	ask(text)
	input_field.text = ""
	input_field.editable = false
	input_field.placeholder_text = "thinking..."

func ask(prompt: String):
	busy = true
	var body = {
		"model": MODEL,
		"messages": [
			{"role": "system", "content": SYSTEM_PROMPT},
			{"role": "user", "content": prompt}
		],
		"max_tokens": 200
	}
	var headers = [
		"Content-Type: application/json",
		"Authorization: Bearer " + API_KEY
	]
	var err = http.request(GATEWAY_URL, headers, HTTPClient.METHOD_POST, JSON.stringify(body))
	if err != OK:
		print("[Kimi] request error: ", err)
		_reset_input()

func _on_response(result, response_code, headers, body):
	var text = body.get_string_from_utf8()
	print("[Kimi] status: ", response_code)
	var data = JSON.parse_string(text)
	if data and data.has("choices"):
		var msg = data["choices"][0]["message"]["content"]
		print("[Kimi] ", msg)
	else:
		print("[Kimi] raw: ", text)
	_reset_input()

func _reset_input():
	busy = false
	input_field.editable = true
	input_field.placeholder_text = "введи сообщение и Enter"
	input_field.grab_focus()
