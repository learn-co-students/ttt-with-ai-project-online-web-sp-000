## Objectives
# 1. Build a command-line interface (CLI).
# 2. Create a domain model with multiple relating and collaborating objects.

class Game
  #extend Players::Human
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
     [0, 1, 2],
     [3, 4, 5],
     [6, 7, 8],
     [0, 3, 6],
     [1, 4, 7],
     [2, 5, 8],
     [0, 4, 8],
     [6, 4, 2]
   ]

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),
                  board = Board.new)
     # defaults to two human players
     @board = board
     @player_1 = player_1
     @player_2 = player_2
   end

end

=begin
describe 'initialize' do
  it 'accepts 2 players and a board' do
    board = Board.new
    player_1 = Player.new("X")
    player_2 = Player.new("O")

    game = Game.new(player_1, player_2, board)

    expect(game.player_1).to eq(player_1)
    expect(game.player_2).to eq(player_2)
    expect(game.board).to eq(board)
  end
=end
