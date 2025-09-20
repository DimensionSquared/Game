extends CanvasLayer

@onready var name_label = $Dialog/VBoxContainer/RichTextLabel2
@onready var normal_label = $Dialog/VBoxContainer/RichTextLabel
@onready var fancy_label = $Dialog/VBoxContainer/Dialog

@onready var characters = $Characters
@onready var overlay = $Overlay

var current_label: RichTextLabel

var dialog_lines: Array[Dictionary] = [
	{"speaker": "Stranger 1", "text": "Hows it going", "label": "normal"},
	{"speaker": "Stranger 2", "text": "Yeah great", "label": "normal"},
	{"speaker": "Stranger 3", "text": "I heard timmy got an a+ last week", "label": "normal"},
	{"speaker": "Stranger 1", "text": "Oh yeah, hes a real smart kid", "label": "normal"},
	{"speaker": "Stranger 4", "text": "Thats great", "label": "normal"},
	{"speaker": "...", "text": "..........", "label": "normal"},
	{"speaker": "Stranger ?", "text": "Who iaw thiqrt blrgh hssk!", "label": "fancy"},
	{"speaker": "Stranger ??", "text": "Leavwl Rkn atayhh!!!", "label": "fancy"},
	{"speaker": "", "text": "RUN!", "label": "fancy"}
]

var current_line: int = 0
var typing: bool = false
var text_speed: float = 0.03
var triggered: bool = false   # once ... happens

func _ready():
	current_label = normal_label
	show_line()

func show_line():
	var line_data = dialog_lines[current_line]
	var label_choice = line_data["label"]

	# set speaker name
	name_label.text = line_data["speaker"]

	# trigger special event when "..." line appears
	if line_data["text"] == "..........":
		trigger_event()

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
				hide()

# special trigger when reaching "..."
func trigger_event():
	if triggered:
		return
	
	triggered = true

	# flip all characters
	for c in characters.get_children():
		if c is AnimatedSprite3D:
			c.flip_h = !c.flip_h

	# fade in overlay (from alpha 0 to 0.5)
	overlay.transparency = 1.0  # fully invisible
	var tween = create_tween()
	tween.tween_property(overlay, "transparency", 0.65, 3.0)
