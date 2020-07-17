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

      case


      index = game.board.cells.find_index{|cell| cell == " "}
      input = (index + 1).to_s
      return input
    end


  def winning_move?(player, index)
    pos = (index + 1).to_s
    this_game.board.taken?(pos) ? return false : return true
    this_game.board.cells[index] = player.token
    outcome = this_game.won?
    this_game.board.cells[index] = " "
    return outcome
  end
end
