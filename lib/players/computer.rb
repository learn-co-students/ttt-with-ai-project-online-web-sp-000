module Players
  class Computer < Player
    # WIN_COMBINATIONS = [
    #   [0,1,2],  # Top row
    #   [3,4,5],  # Middle row (horizontal)
    #   [6,7,8],  # Bottom row
    #   [0,3,6],  # Left Column
    #   [1,4,7],  # Middle Column
    #   [2,5,8],  # Right Column
    #   [0,4,8],  # Diagonal 1 (negative slope)
    #   [2,4,6]   # Diagonal 2 (positive slope)
    # ]





    def move(board)
if self == game.player_1
  them = game.player_2
else
  them = game.player_1
end
    #   if board.turn_count == 0
    #     input = "1"
    #   else
    #     case board
    #     when condition
    #
    #     end
    #   end
    # end



case board.turn_count
when 0
  input = "1"
when 1
  their_positions == [5] ? input == "1" : input == "5"
when 2
  case board
  when two_in_a_row?(self) && winning_move?(self)
    input = winning_move?(self).to_s
  when two_in_a_row?(them) && winning_move(them)
    input = winning_move?(them).to_s
  when fork_possible?(self) != false
      input = fork_possible(self) + 1
  end
when 3

when 4

when 5

when 6

when 7

when 8

when 9

end







      return input
    end

def my_positions
  my_pos = []
  board.each_index {|contents, index|
    if contents == self.token
      my_pos << index
    end }
  return my_pos
end


def their_positions
  self.token == "X" ? their_token == "O" : their_token == "X"
  their_pos = []
  board.each_index {|contents, index|
    if contents == their.token
  their_pos << index
end }
  return their_pos
end

def empty_positions
  # empty_positions = ((1..9).to_a - my_positions) - their_positions
  board.cells.map { |cell| !board.cell.taken? }
end

def two_in_a_row?(player)
  matches = WIN_COMBINATIONS.select{|combo| (player.positions & combo).count == 2}
  if matches.count == 0
    return false
  else
    return matches
  end
end

def winning_move?(player)
 if two_in_a_row?(player) == false
   return false
 else
   winning_set = two_in_a_row?(player).find{|match| !board.taken?(match - player.positions)}
 end

if winning_set = nil
  return false
else
  return winning_set - player.positions
end
end


def fork_possible?(player)
  # test_board = game.board
  found = false
  empty_positions.find {|empty_pos|
    game.board[empty_pos] = player.token
    if two_in_a_row?(player).count >= 2
      found = empty_pos
      game.board[empty_pos] = " "
    else
      found = false
      game.board[empty_pos] = " "
    }
return found
end


  end
