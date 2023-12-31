extends interactableUI

var area = get_owner()
var page : int = 0
var pages: Array
@export var text : String
@onready var label = $CanvasLayer/Page1
@onready var pagePrev = $CanvasLayer/PagePrev
@onready var pageNext = $CanvasLayer/PageNext

@export var answerNeeded : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pages = text.split("|", false)
	label.text = pages[page]
	if answerNeeded == false:
		get_child(0).get_child(5).queue_free()
#	print(pages)
#	for page in pages:
#		label.append_text("[p]"+page+"[/p]")
#		for i in range(1000):
#			label.newline()
#	label.set_scroll_active(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if page == 0:
		pagePrev.hide()
		pageNext.show()
		if pages.size() == 1:
			pageNext.hide()
	elif page == pages.size()-1:
		pageNext.hide()
		if page != 0:
			pagePrev.show()
	else:
		pagePrev.show()
		pageNext.show()
		

func _on_page_prev_pressed():
	page -= 1
	label.text = pages[page]

func _on_page_next_pressed():
	page += 1
	label.text = pages[page]



