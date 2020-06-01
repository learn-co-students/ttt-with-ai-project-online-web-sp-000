test_game = Game.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O"), board=Board.new)

random = rand(9)
Game.WIN_COMBINATIONS[random]