extends ConfirmationDialog


func _ready():
	get_ok().text = "Sair"
	get_cancel().text = "Cancelar"


func _on_Confirm_confirmed():
	get_tree().quit()
