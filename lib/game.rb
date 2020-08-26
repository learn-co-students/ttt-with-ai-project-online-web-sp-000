class Game
  attr_reader :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    #why is board something passed in.... weird... do they pass in non-empty boards?
    #looks like it wants u to mdefault the players to be human players
    #that means if without arguments, u defualt to....

    #problem:
    #if u do PLayers::Human.new, it says undefined method `Human' for Players:Module
    #(btw this is when i do class Human < Player, no namespacing
    #if i do namespacing, class Players::Human < Player, it still says         undefined method `Human' for Players:Module
    #if u do Human.new it says uninitialized constant Game::Human as if human belong to game...

    end



end #end class
