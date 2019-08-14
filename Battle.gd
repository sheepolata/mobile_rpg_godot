extends Node

onready var enemy = $Enemy
onready var player_stats = $PlayerStats
onready var battle_actions_button = $UI/BattleActionsButtons

func _ready():
	start_player_turn()

func start_enemy_turn():
	battle_actions_button.hide()
	if enemy != null:
		enemy.attack(player_stats)
		yield(enemy, "end_turn")
	start_player_turn()
	
func start_player_turn():
	battle_actions_button.show()
	player_stats.ap = player_stats.max_ap
	yield(player_stats, "end_turn")
	start_enemy_turn()

func _on_Enemy_death():
	battle_actions_button.hide()
	enemy = null