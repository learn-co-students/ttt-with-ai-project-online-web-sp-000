module Players
  class Computer < Player

    def move(board)


      if(board.empty?)
        return 4
      else
        if self.token == "X"
            winning_comb = Game::WIN_COMBINATIONS.find { |item| item[0] == " " || item[1] == " " || item[2] == " " &&
              item[0] != "O" && item[1] != "O" && item[2] != "O"
              }
              winning_comb[0]
            end
        else
          winning_comb = Game::WIN_COMBINATIONS.find { |item| item[0] == " " || item[1] == " " || item[2] == " " &&
            item[0] == "O" || item[1] == "O" || item[2] == "O"
            }
            winning_comb[0]

        end
      end
    end

  end
end
