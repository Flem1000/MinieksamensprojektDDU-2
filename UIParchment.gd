extends interactableUI

var area = get_owner()
var page : int = 0
@export var text : String
@onready var label = $CanvasLayer/Page1


# Called when the node enters the scene tree for the first time.
func _ready():
	print(label.text)
	var pages = label.text.split("|", false)
	print(pages)
	for page in pages:
		label.append_text("[p]"+page+"[/p]")
		for i in range(1):
			label.newline()
	label.set_scroll_active(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_page_prev_pressed():
	page -= 1
	label.scroll_to_paragraph(page)

func _on_page_next_pressed():
	page += 1
	label.scroll_to_paragraph(page)



