extends Control

export(String, MULTILINE) var info = ""

func _on_HoverInfo_mouse_entered():
	var main = get_tree().current_scene
	var text_box = main.find_node("TextBox")
	if text_box != null:
		text_box.text = info


func _on_HoverInfo_mouse_exited():
	var main = get_tree().current_scene
	var text_box = main.find_node("TextBox")
	if text_box != null:
		text_box.text = ""
