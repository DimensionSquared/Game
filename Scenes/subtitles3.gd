extends CanvasLayer

@onready var name_label = $Dialog/VBoxContainer/RichTextLabel2
@onready var normal_label = $Dialog/VBoxContainer/RichTextLabel
@onready var fancy_label = $Dialog/VBoxContainer/Dialog

@onready var characters = $Characters        # container with AnimatedSprite3D children
	  # fades in after "..."

var current_label: RichTextLabel


var dialog_lines: Array[Dictionary] = [
	{"speaker": "", "text": "RUN!!!!", "label": "fancy"}
]

var current_line: int = 0
var typing: bool = false
var text_speed: float = 0.03
var triggered: bool = false   # once "..." happens

func _ready():
	current_label = normal_label
	show_line()

func show_line():
	var line_data = dialog_lines[current_line]
	var label_choice = line_data["label"]

	# set speaker name
	name_label.text = line_data["speaker"]

	# pick which text label to use
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



func _on_area_3d_4_area_entered(area: Area3D) -> void:
	visible = false
