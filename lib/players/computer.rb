require 'pry'
require 'set'
module Players
  class Computer < Player

    def move
      #Identify Players
      self == game.player_1 ? them = game.player_2 : them = game.player_1

      #Get/update lists of relevant positions before executing each move
      $self_positions = game.board.cells.each_index.select{ |i| game.board.cells[i] == self.token}.map!{|i| i + 1}.to_set
      $them_positions = game.board.cells.each_index.select{ |i| game.board.cells[i] == them.token}.map!{|i| i + 1}.to_set
      $empty_positions = (1..9).to_set - $self_positions - $them_positions

      #Computer/AI strategy
      case game.board.turn_count
      #First 4 turns are hardcoded
      when 0
        input = "1" #Corner opening move gives opponent least number of positions that can end in win/draw
      when 1
        $them_positions.include?(game.board.center) ? input = "1" : input = "5"  # Respond to center opening move with a corner, or take the center if available
      when 2
        #Play corner opposite original
        if game.board.taken?("1")
          input = "9"
        elsif game.board.taken?("9")
          input = "1"
        elsif game.board.taken?("3")
          input = "7"
        elsif game.board.taken?("7")
          input = "3"
        end
      when 3
        #Play an available edge
        if !game.board.taken?("2")
          input = "2"
        elsif !game.board.taken?("4")
          input = "4"
        elsif !game.board.taken?("6")
          input = "6"
        elsif !game.board.taken?("8")
          input = "8"
        end
      #Remaining turns use first available move from the list of "rules" (see comment at end of document)
      when (4..9)
        if two_in_a_row?(self).count > 0
          input = (two_in_a_row?(self)[0] + 1).to_s
        elsif two_in_a_row?(them).count > 0
          input = (two_in_a_row?(them)[0] + 1).to_s
        elsif fork_possible?(self) != nil
          input = (fork_possible?(self) + 1).to_s
        elsif fork_possible?(them) != nil
          input = (fork_possible?(them) + 1).to_s
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
          index = game.board.cells.find_index{|cell| cell == " "}   #Catch-all, *should* never have to be used
          input = (index + 1).to_s
        end
      end
      return input
    end

    #Test for two in a rows (win or block)
    def two_in_a_row?(player)
      winning_indexes = []
      existing_indexes = game.board.cells.each_index.select{ |i| game.board.cells[i] == player.token}
      empty_indexes = $empty_positions.to_a.map!{|i| i - 1}
      empty_indexes.each{|test_index|
                          existing_indexes << test_index
                          test_combos = existing_indexes.permutation(3).to_a
                          existing_indexes.pop
                          winning_combos = []
                          Game::WIN_COMBINATIONS.each{ |win_combo|
                            test_combos.include?(win_combo) ? winning_combos << win_combo : false}
                          winning_combos.count > 0 ? winning_indexes << test_index : false
                          }

      return winning_indexes
    end

    #Make a fork if possible, or block opponent's potential fork (anticipates next move)
    #Tries every empty position, and checks to see if (2) two_in_a_row's have been created as a result
    def fork_possible?(player)
      fork_index = nil
      existing_indexes = game.board.cells.each_index.select{ |i| game.board.cells[i] == player.token}
      empty_indexes = $empty_positions.to_a.map!{|i| i - 1}
      empty_indexes.detect{|test_index|
                            existing_indexes << test_index
                            winning_indexes = two_in_a_row?(player)
                            existing_indexes.pop
                            if winning_indexes.count >= 2
                              fork_index = test_index
                              return true
                            end
                          }
      return fork_index
    end

  end
end


# AI Strategy/Rule list (use first available move from the list):

  # 1.  Win (two_in_a_row)
  # 2.  Block (two_in_a_row)
  # 3.  Create a Fork
  # 4.  Block a Fork from being created
  # 5.  Play the center position
  # 6.  Play corner opposite corner taken previously by opponent.
  # 7.  Play an available corner
  # 8.  Play an available side/edge (middle position)
