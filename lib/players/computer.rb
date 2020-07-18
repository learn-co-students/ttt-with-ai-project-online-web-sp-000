require 'pry'
require 'set'
module Players
  class Computer < Player
    $this_game
    $self_positions
    $them_positions
    $empty_positions
    $corners = Set[1, 3, 7, 9]
    $edges = Set[2, 4, 6, 8]
    $center = 5
    def move(game)
      $this_game = game
      if self == game.player_1
        them = game.player_2
      else
        them = game.player_1
      end

      $self_positions = game.board.cells.each_index.select{ |i| game.board.cells[i] == self.token}.each{|i| i + 1}.to_set
      $them_positions = game.board.cells.each_index.select{ |i| game.board.cells[i] == them.token}.each{|i| i + 1}.to_set
      empty_positions

      case game.board.turn_count
      when 0
        input = "1"
      when 1
        $them_positions.include?(5) ? input = "1" : input = "5"
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
        empty_edges = ($edges - $them_positions - $self_positions).to_a
        input = empty_edges[0].to_s
      when 4
        if ($this_game.current_player == self) && (winning_move?(self) != nil)
          input = (winning_move?(self) + 1).to_s
        elsif ($this_game.current_player == them) && (winning_move?(them) != nil)
          input = (winning_move?(them) + 1).to_s
        else
        index = game.board.cells.find_index{|cell| cell == " "}
        input = (index + 1).to_s
      end
    when (5..9)

      end
      return input
    end


  def winning_move?(player)
    winning_index = nil
    existing_indexes = $this_game.board.cells.each_index.select{ |i| $this_game.board.cells[i] == player.token}
    empty_indexes = $empty_positions.to_a.map!{|i| i - 1}
    # binding.pry
    empty_indexes.each{|test_index|
              $this_game.board.cells[test_index] = player.token
              winning_combo = $this_game.won?
              $this_game.board.cells[test_index] = " "
              # existing_indexes << test_index
              # test_combos = existing_indexes.permutation(3).to_a
              # existing_indexes.pop
              # winning_combo = Game::WIN_COMBINATIONS.detect{ |win_combo| test_combos.include?(win_combo) }
              # # winning_combo = $this_game.won?
              # existing_indexes.pop
              if winning_combo != false
                winning_index = test_index
              end
             }
    return winning_index


  #   experms = exes.permutation(3).to_a
  #   ohperms = ohs.permutation(3).to_a
  #   x_winning_index = WIN_COMBINATIONS.detect{ |win_combo| experms.include?(win_combo) }
  #   o_winning_index = WIN_COMBINATIONS.detect{ |win_combo| ohperms.include?(win_combo) }
  #  winning_pos = nil
  #  $empty_positions.to_a.find{}
  #   pos = (index + 1).to_s
  #   if $this_game.board.taken?(pos)
  #     return true
  #   else
  #     return false
  #   end
  #   $this_game.board.cells[index] = player.token
  #   outcome = $this_game.won?
  #   $this_game.board.cells[index] = " "
  #   return outcome
  end

  def empty_positions
  $empty_positions = (1..9).to_set - $self_positions - $them_positions
  return $empty_positions
    # return $this_game.board.cells.select{ |cell| $this_game.board.taken?(cell) }.to_set
  end


  def two_in_a_row?(player_positions)
matches = Game::WIN_COMBINATIONS.select{|combo| (player_positions & combo.to_set).size == 2}
  if matches.count == 0
   return false
   else
   return matches
   end
  end

end
end
