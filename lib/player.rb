class Player


attr_reader :token, :positions


def initialize(token)
  @token = token
  @positions = []
end

def positions
  @positions.clear
  Game.current_game.board.cells.each {|contents|
    if contents == self.token
      @positions << Game.current_game.board.cells.index(contents) + 1
    end }
  return @positions
end

end
