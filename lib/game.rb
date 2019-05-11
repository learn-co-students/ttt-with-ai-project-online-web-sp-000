require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  def initialize (player_1 = Players::Human.new('X'), player_2 =Players::Human.new('O'), board = Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
  def current_player
    count = self.board.turn_count
      if count % 2 == 0
        player = self.player_1
      else
        player = self.player_2
      end
    player
  end
  def won?
      WIN_COMBINATIONS.each do |combo|
        #creates an array to test with #all?
        posit = [" ", " ", " "]
        counter = 0
        #starts loop to test posit
        combo.each do |windex|
        posit[counter] = self.board.cells[windex]
        counter +=1
        #tests for full array
        if posit.all? {|var| var == "X"}
          return combo
        elsif posit.all? {|var| var == "O"}
          return combo
        end
      end
    end
    return false
  end
  def draw?
    if board.full? == true
      !won?
    end
  end
  def over?
    self.draw? || self.won? != false
  end
  def winner
    if self.won? != false
      place = self.won?[0]
      win = board.cells[place]
      win
    end
  end
end
