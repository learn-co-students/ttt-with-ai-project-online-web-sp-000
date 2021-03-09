module Players

  class Computer < Player

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    def move(board)

      choices = options(board)

      if two_of_three?(board)
        # puts("2/3")
        input = two_of_three?(board)
      elsif defense?(board)
        input = defense?(board)
      elsif board.valid_move?(5)
        # puts("5")
        input = 5
      elsif corner_options(board).size > 0
        # puts("corners")
        input = corner_options(board).sample
      else
        # puts("rand")
        input = rand(1..9) while !board.valid_move?(input)
      end
      input.to_s
    end


    def two_of_three?(board)
      index = nil
      WIN_COMBINATIONS.each do |combo|
        state = [board.at(combo[0]), board.at(combo[1]), board.at(combo[2])]
        # binding.pry
        if state.count(self.token) == 2 && state.include?(" ")
        #   binding.pry
          index = combo[state.index(" ")]
        end
      end
      index + 1 if index
    end

    def defense?(board)
      index = nil
      self.token == "X" ? enemy = "O" : enemy = "X"

      WIN_COMBINATIONS.each do |combo|
        state = [board.at(combo[0]), board.at(combo[1]), board.at(combo[2])]
        # binding.pry
        if state.count(enemy) == 2 && state.include?(" ")
        #   binding.pry
          index = combo[state.index(" ")]
        end
      end
      index + 1 if index
    end

    # def winning_move(board, player)
    #
    #   if player = self
    #     checking = self.token
    #   else
    #     self.token == "X" ? checking = "O" : checking = "X"
    #   end
    #   index = nil
    #
    #   WIN_COMBINATIONS.each do |combo|
    #     state = [board.at(combo[0]), board.at(combo[1]), board.at(combo[2])]
    #     # binding.pry
    #     if state.count(checking) == 2 && state.include?(" ")
    #     #   binding.pry
    #       index = combo[state.index(" ")]
    #     end
    #   end
    #   index + 1 if index
    # end

    def options(board)
      choice = []
      board.cells.each_with_index do |spot, index|
        choice.push(index + 1) if spot == " "
      end
      choice
    end

    def corner_options(board)
      options(board).select {|spot| [1, 3, 7, 9].include?(spot)}
    end

    # binding.pry
  end
end
