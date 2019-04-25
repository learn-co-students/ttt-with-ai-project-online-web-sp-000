require 'pry'

class Game
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
  ].freeze


    def initialize(player_1 = "X",player_2 ="O",board)
      self.player_1 = player_1
      self.player_2 = player_2
      self.board = board
    end

end
