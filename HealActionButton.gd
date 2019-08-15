extends "res://ActionButton.gd"

func _on_pressed():
	var player_stats = BattleUnits.player_stats
	
	if player_stats != null:
		if player_stats.mp >= 8:
			player_stats.mp -= 8
			player_stats.hp += 10
			player_stats.ap -= 1