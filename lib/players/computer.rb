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
  when two_in_a_row?
    input = two_in_a_row?.to_s
  when forks_possible?

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
  empty_positions = ((1..9).to_a - my_positions) - their_positions
end


def two_in_a_row?
  my_matches = WIN_COMBINATIONS.select{|combo| (my_positions & combo).count == 2}
  their_matches = WIN_COMBINATIONS.select{|combo| (their_positions & combo).count == 2}
  if (my_matches.count >= 1)
    winning_set = my_matches.find{|match| !board.taken?(match - my_positions)}
    unless winning_set == nil
      return winning_set - my_positions
    end
  elsif (their_matches.count >= 1)
    winning_set = their_matches.find{|match| !board.taken?(match - their_positions)}
    unless winning_set == nil
      return winning_set - their_positions
    end
  else
    return false
  end
    # if matches.find{|match| !board.taken?(match - my_positions)}
    # && ((WIN_COMBINATIONS - my_positions)[0])
end
end

# def two_in_a_row_win?
#   matches = WIN_COMBINATIONS.select{|combo| (my_positions & combo).count == 2)}
#   if (matches.count >= 1)
#     winning_set = matches.find{|match| !board.taken?(match - my_positions)}
#     if winning_set == nil
#       return false
#     else
#       return winning_set - my_positions
#     end
#   else
#     return false
#   end
#     # if matches.find{|match| !board.taken?(match - my_positions)}
#     # && ((WIN_COMBINATIONS - my_positions)[0])
# end
#     winning_set = matches.find{|match| !board.taken?(match - my_positions)}
#     if winning_set == nil
#       return false
#     else
#       return winning_set - my_positions
#     end
#   else
#     return false
#   end
#     # if matches.find{|match| !board.taken?(match - my_positions)}
#     # && ((WIN_COMBINATIONS - my_positions)[0])
# end
#
# def two_in_a_row_block?
#   matches = WIN_COMBINATIONS.select{|combo| (their_positions & combo).count == 2)}
#   if (matches.count >= 1)
#     winning_set = matches.find{|match| !board.taken?(match - their_positions)}
#     if winning_set == nil
#       return false
#     else
#       return winning_set - their_positions
#     end
#   else
#     return false
#   end
# end

def forks_possible?

end


  end
