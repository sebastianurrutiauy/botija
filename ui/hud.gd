class_name ExplorationHUD
extends CanvasLayer
signal menu_selected(action: String)
@onready var place_label: Label = %PlaceLabel
@onready var goal_label: Label = %GoalLabel
@onready var dialog: Label = %Dialog
@onready var prompt: Label = %Prompt
@onready var controls: Label = %Controls
@onready var menu: PauseMenu = %PauseMenu
@onready var menu_title: Label = menu.title
@onready var fade: ColorRect = %Fade
func _ready() -> void:
	menu.action_selected.connect(_on_menu_selected)
func _on_menu_selected(action: String) -> void:
	menu_selected.emit(action)
func show_pause(value: bool) -> void:
	if value:
		menu.open()
	else:
		menu.hide()
