require 'pry'
module Players

  class Human < Player

    def move(board)
      gets.chomp
    end
  end

  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    def move(board)
      #If Center Square empty, move there

      # if board.turn_count == 3
      #   binding.pry
      # end
      if board.cells[4] == " "
        return "5"
      end


      WIN_COMBINATIONS.each do |combo|
        #If Winning move available, move there
        if [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]].count(self.token) == 2 && [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]].include?(" ")
          return (combo[[board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]].index(" ")] + 1).to_s
        end
        #If Blocking required, move to block
        if [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]].count(self.token) == 0 && [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]].count(" ") == 1
          return (combo[[board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]].index(" ")] + 1).to_s
        end
      end
      #Choose random corner
      if board.cells[0] == " "
        return "1"
      elsif board.cells[2] == " "
        return "3"
      elsif board.cells[6] == " "
        return "7"
      elsif board.cells[8] == " "
        return "9"
      end
      #Choose random side
      if board.cells[1] == " "
        return "2"
      elsif board.cells[3] == " "
        return "4"
      elsif board.cells[5] == " "
        return "6"
      elsif board.cells[7] == " "
        return "8"
      end
    end
  end


end
