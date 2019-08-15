extends Node

const BattleUnits = preload("res://BattleUnits.tres")

onready var battle_actions_button = $UI/BattleActionsButtons

func _ready():
	start_player_turn()

func start_enemy_turn():
	battle_actions_button.hide()
	var enemy = BattleUnits.enemy
	if enemy != null:
		enemy.attack()
		yield(enemy, "end_turn")
	start_player_turn()
	
func start_player_turn():
	battle_actions_button.show()
	var player_stats = BattleUnits.player_stats
	player_stats.ap = player_stats.max_ap
	yield(player_stats, "end_turn")
	start_enemy_turn()

func _on_Enemy_death():
	battle_actions_button.hide()
