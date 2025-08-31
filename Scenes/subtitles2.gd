extends CanvasLayer

@onready var name_label = $Dialog/VBoxContainer/RichTextLabel2
@onready var normal_label = $Dialog/VBoxContainer/RichTextLabel
@onready var fancy_label = $Dialog/VBoxContainer/Dialog

var current_label: RichTextLabel

@onready var char1 = $Dad
@onready var char2 = $Mum

var dialog_lines: Array[Dictionary] = [
	{"speaker": "Mum", "text": "Hey kid (press enter to continue)", "label": "normal"},
	{"speaker": "Mum", "text": "Were throwing a party, why not come out and see the guests?", "label": "fancy"},
	{"speaker": "Dad", "text": "Yeah, be social for once", "label": "normal"},
	{"speaker": "Mum", "text": "And no comlaining", "label": "fancy"}
	]

var current_line: int = 0
var typing: bool = false
var text_speed: float = 0.03

func _ready():
	current_label = normal_label
	show_line()

func show_line():
	var line_data = dialog_lines[current_line]
	var label_choice = line_data["label"]

	# set speaker name
	name_label.text = line_data["speaker"]

	# choose which text label to use
	if label_choice == "normal":
		fancy_label.hide()
		normal_label.show()
		current_label = normal_label
	else:
		normal_label.hide()
		fancy_label.show()
		current_label = fancy_label

	# reset label text
	current_label.clear()
	typing = true
	type_text(line_data["text"])

func type_text(text: String) -> void:
	var i = 0
	while i < text.length():
		current_label.append_text(text[i])
		await get_tree().create_timer(text_speed).timeout
		i += 1
	typing = false

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if typing:
			current_label.text = dialog_lines[current_line]["text"]
			typing = false
		else:
			current_line += 1
			if current_line < dialog_lines.size():
				show_line()
			else:
				end_dialog()

func end_dialog():
	# hide both children
	char1.hide()
	char2.hide()
	# (optional) free them from memory:
	# panel.queue_free()
	# portrait_box.queue_free()
