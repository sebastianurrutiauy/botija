class_name PauseMenu
extends PanelContainer
signal action_selected(action: String)
@onready var title: Label = %MenuTitle
@onready var resume_button: Button = %SeguirExplorando
func _ready() -> void:
	%SeguirExplorando.pressed.connect(_select.bind("resume"))
	%CargarPaseo.pressed.connect(_select.bind("load"))
	%ReiniciarPaseo.pressed.connect(_select.bind("restart"))
	%Salir.pressed.connect(_select.bind("quit"))
func _select(action: String) -> void:
	action_selected.emit(action)
func open() -> void:
	show()
	title.text = "Un ratito de calma"
	resume_button.grab_focus()
