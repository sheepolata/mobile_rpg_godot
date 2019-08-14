extends "res://ActionButton.gd"

func _on_pressed():
	var main = get_tree().current_scene
	
	var player_stats = main.find_node("PlayerStats")
	
	if player_stats != null:
		if player_stats.mp >= 8:
			player_stats.mp -= 8
			player_stats.hp += 10
			player_stats.ap -= 1