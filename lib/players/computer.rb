require 'pry'
module Players
  class Computer < Player
    this_game = nil
    def move(game)
      this_game = game
      if self == game.player_1
        them = game.player_2
      else
        them = game.player_1
      end

      self_positions = game.board.cells.each_index.select{ |i| game.board.cells[i] == self.token}
      them_positions = game.board.cells.each_index.select{ |i| game.board.cells[i] == them.token}


      case game.board.turn_count
      when 0
        input = "1"
      when 1
        them_positions == [5] ? input = "1" : input = "5"
      when 2


      when (3..9)
        index = game.board.cells.find_index{|cell| cell == " "}
        input = (index + 1).to_s
      end
      return input
    end


  def winning_move?(player, index)
    pos = (index + 1).to_s
    if this_game.board.taken?(pos)
      return true
    else
      return false
    end
    this_game.board.cells[index] = player.token
    outcome = this_game.won?
    this_game.board.cells[index] = " "
    return outcome
  end
end
end
