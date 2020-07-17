require 'pry'
class Player


attr_accessor :token, :positions

def initialize(token)
  @token = token
  @positions = []
end


def two_in_a_row?(player)
  # puts player.inspect
  # puts Game::WIN_COMBINATIONS.inspect
  # matches = Game::WIN_COMBINATIONS.select{|player, combo| (player.positions & combo).count == "2"}
  matches = matches?(player)
  if matches.count == 0
    return false
  else
    return matches
  end
end



def winning_move?(player)
  # binding.pry
 if two_in_a_row?(player) == false
   return false
 else
   winning_set = two_in_a_row?(player).find{|match| !Game.current_game.board.taken?(match - player.positions)}
 end

if winning_set == nil
  return false
else
  return winning_set - player.positions
end
end


def fork_possible?(player)
  # test_board = Game.current_game.board
  found = false
  Game.current_game.board.empty_positions.find{|empty_pos|
    Game.current_game.board.cells[empty_pos.to_i - 1] = player.token
    if two_in_a_row?(player) == false
      found = empty_pos.to_i
      Game.current_game.board.cells[empty_pos.to_i - 1] = " "
    elsif two_in_a_row?(player).count >= 2
      found = false
      Game.current_game.board.cells[empty_pos.to_i - 1] = " "
    end
    }

return found
end

# def positions=
#   binding.pry
#   # @positions = Game.current_game.board.cells.each_index.select{ |i| Game.current_game.board.cells[i] == self.token}
#   @positions = Game.current_game.board.cells.each_index.select{ |i| Game.current_game.board.cells[i] == Game.current_game.current_player.token}
#   # @positions.clear
#   # Game.current_game.board.cells.each_index{|cell|
#   #   if cell == Game.current_game.current_player.token
#   #     @positions << Game.current_game.board.cells.index(cell) + 1
#   #   end }
#   return @positions
# end

# def two_in_a_row?(player)
#   pos = player.positions
#   matches = []
#   Game::WIN_COMBINATIONS.each{|combo, index| (pos & combo).count == 2 ? matches << combo : false }
#   if matches.count == 0
#     return false
#   else
#     return matches
#   end
# end

def matches?(player)
  matches = []
    Game::WIN_COMBINATIONS.each{|combo| count = 0
    if player.positions.include?(combo[0])
    count += 1
  end
if player.positions.include?(combo[1])
  count += 1
end
if player.positions.include?(combo[2])
  count += 1
end
if count >= 2
  matches << combo
end
 }
 return matches
end


end
