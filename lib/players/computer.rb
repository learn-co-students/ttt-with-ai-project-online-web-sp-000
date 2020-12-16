module Players
  class Computer < Player

    def move(board)
      if(board.empty?)
        return 4
      else
        #if self.token == "X"
            winning_comb = Game::WIN_COMBINATIONS.find { |item|
              (board.cells[item[0]] == "X" && board.cells[item[1]] == "X") || (board.cells[item[0]] == "X" &&  board.cells[item[2]] == "X") ||
              (board.cells[item[1]] == "X" &&  board.cells[item[2]] == "X")
              }

              if winning_comb == nil
                  puts "there are no two Xs or Os in one row, looking for single"
                  winning_comb = Game::WIN_COMBINATIONS.find { |item| (!board.taken?(item[0]) || !board.taken?(item[1]) || !board.taken?(item[2])) &&
                (board.cells[item[0]] == "X" || board.cells[item[1]] == "X" || board.cells[item[2]] == "X")}
              end
              if winning_comb == nil
                puts "there are no single Xs or Os winning combination is nil, just looking for the first empty space"
                move = board.cells.find {|index| board.cells[index]== " " }
                puts "move "+move.to_s
                move
              else
                puts winning_comb.to_s + "winning combination"
                move = winning_comb.find {|index| !board.taken?(index) }
                puts "move "+move.to_s
                move
              end
        #else
          #winning_comb = Game::WIN_COMBINATIONS.find { |item| !board.taken?(item[0]) || !board.taken?(item[1]) || !board.taken?(item[2]) &&
          #  item[0] == "O" || item[1] == "O" || item[2] == "O"
          #  }
          #  puts winning_comb.to_s + "winning combination"
          #  if winning_comb == nil
          #    move = board.cells.find {|index| board.cells[index]== " " }
          #    puts move.to_s +"move"
          #    move
          #  else
          #    move = winning_comb.find {|index| !board.taken?(index)}
          #    puts "move"
          #    puts move
          #    move
          #  end
        #end
      end
    end
  end
end
