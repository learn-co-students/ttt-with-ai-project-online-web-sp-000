require 'pry'
require 'set'
module Players
  class Computer < Player

    def move
      if self == game.player_1
        them = game.player_2
      else
        them = game.player_1
      end

      $self_positions = game.board.cells.each_index.select{ |i| game.board.cells[i] == self.token}.map!{|i| i + 1}.to_set

      $them_positions = game.board.cells.each_index.select{ |i| game.board.cells[i] == them.token}.map!{|i| i + 1}.to_set

      $empty_positions = (1..9).to_set - $self_positions - $them_positions



      case game.board.turn_count
      when 0
        if them.class == Players::Computer
        input = "1"
      else
        input = "5"
      end

      when 1
        if $them_positions.include?(game.board.center)
          input = "1"
        else
          input = "5"
        end
      when 2
        if game.board.taken?("5")
          if game.board.taken?("1")
            input = "9"
          elsif game.board.taken?("9")
            input = "1"
          elsif game.board.taken?("3")
            input = "7"
          elsif game.board.taken?("7")
            input = "3"
          else
            index = game.board.cells.find_index{|cell| cell == " "}
            input = (index + 1).to_s
          end
        end
      when 3
        empty_edges = (game.board.edges - $them_positions - $self_positions).to_a
        input = empty_edges[0].to_s
      when (4..9)

        if winning_move?(self).count > 0
          input = (winning_move?(self)[0] + 1).to_s
        elsif winning_move?(them).count > 0
          input = (winning_move?(them)[0] + 1).to_s
        elsif fork?(self) != nil
          input = (fork?(self) + 1).to_s
        elsif fork?(them) != nil
          input = (fork?(them) + 1).to_s
        elsif !game.board.taken?((game.board.center).to_s)
          input = (game.board.center).to_s
        elsif $them_positions.include?(1) && $empty_positions.include?(9)
          input = "9"
        elsif $them_positions.include?(9) && $empty_positions.include?(1)
          input = "1"
        elsif $them_positions.include?(3) && $empty_positions.include?(7)
          input = "7"
        elsif $them_positions.include?(7) && $empty_positions.include?(3)
          input = "3"
        elsif ($empty_positions.to_set & game.board.corners).count > 0
          input = (($empty_positions.to_set & game.board.corners).to_a[0]).to_s
        elsif ($empty_positions.to_set & game.board.edges).count > 0
          input = (($empty_positions.to_set & game.board.edges).to_a[0]).to_s
        else
        index = game.board.cells.find_index{|cell| cell == " "}
        input = (index + 1).to_s
      end

    # when 5
    #   if winning_move?(self) != nil
    #     input = (winning_move?(self) + 1).to_s
    #   elsif winning_move?(them) != nil
    #     input = (winning_move?(them) + 1).to_s
    #   else
    #   index = game.board.cells.find_index{|cell| cell == " "}
    #   input = (index + 1).to_s
    # end
    # binding.pry
  # when (4..9)
  #   index = game.board.cells.find_index{|cell| cell == " "}
  #   input = (index + 1).to_s

      end
      return input
    end

    #
    # if (game.current_player == self) && (winning_move?(self) != nil)
    #   input = (winning_move?(self)).to_s
    # elsif (game.current_player == self) && (winning_move?(them) != nil)
    #   input = (winning_move?(them)).to_s
    # else
    # index = game.board.cells.find_index{|cell| cell == " "}
    # input = (index + 1).to_s
    # end
def identify
  game = game
  if self == game.player_1
    them = game.player_2
  else
    them = game.player_1
  end
end

  def winning_move?(player)

    winning_indexes = []
    existing_indexes = game.board.cells.each_index.select{ |i| game.board.cells[i] == player.token}

    empty_indexes = $empty_positions.to_a.map!{|i| i - 1}

    empty_indexes.each{|test_index|
              # game.board.cells[test_index] = player.token
              # winning_combo = game.won?
              # game.board.cells[test_index] = " "
              existing_indexes << test_index
              # binding.pry
              test_combos = existing_indexes.permutation(3).to_a

              existing_indexes.pop
              winning_combos = []
              Game::WIN_COMBINATIONS.each{ |win_combo|
                test_combos.include?(win_combo) ? winning_combos << win_combo : false
                  }

              # winning_combo = game.won?

              if winning_combos.count > 0
                winning_indexes << test_index
              end
             }

    return winning_indexes
end

def fork?(player)
  fork_index = nil
  existing_indexes = game.board.cells.each_index.select{ |i| game.board.cells[i] == player.token}

  empty_indexes = $empty_positions.to_a.map!{|i| i - 1}

  empty_indexes.detect{|test_index|
            # game.board.cells[test_index] = player.token
            # winning_combo = game.won?
            # game.board.cells[test_index] = " "
            existing_indexes << test_index

            # test_combos = existing_indexes.permutation(3).to_a



            winning_indexes = winning_move?(player)

            existing_indexes.pop

            # winning_combo = Game::WIN_COMBINATIONS.detect{ |win_combo| test_combos.include?(win_combo)}

            if winning_indexes.count >= 2
              fork_index = test_index
              return true
            end
            }

            return fork_index
            end








# forks = Game::WIN_COMBINATIONS.select{|combo|
#   test_index = (combo.to_set - empty_indexes.to_set).to_a
#   if test_index.size ==
#
#
# }
#   if matches.count == 0
#    return false
#    else
#    return matches
#    end
#   end

end
end



#   experms = exes.permutation(3).to_a
#   ohperms = ohs.permutation(3).to_a
#   x_winning_index = WIN_COMBINATIONS.detect{ |win_combo| experms.include?(win_combo) }
#   o_winning_index = WIN_COMBINATIONS.detect{ |win_combo| ohperms.include?(win_combo) }
#  winning_pos = nil
#  $empty_positions.to_a.find{}
#   pos = (index + 1).to_s
#   if game.board.taken?(pos)
#     return true
#   else
#     return false
#   end
#   game.board.cells[index] = player.token
#   outcome = game.won?
#   game.board.cells[index] = " "
#   return outcome

# def empty_positions
# $empty_positions = (1..9).to_set - $self_positions - $them_positions
# return $empty_positions
#   # return game.board.cells.select{ |cell| game.board.taken?(cell) }.to_set
# end
