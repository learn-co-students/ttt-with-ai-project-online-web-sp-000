module Players
  class Computer < Player
  attr_accessor :token, :combos
    def initialize(token)
     @token = token
       @combos = Game::WIN_COMBINATIONS
       @opponents_token = "O" if @token == "X"
       @opponents_token = "X" if @token == "O"
    end


    def move(board)
    move_index =
  case
     when take_middle(board)
      take_middle(board)
      when win(board)
        win(board)
        when block(board)
          block(board)
          when corner(board)
            corner(board)
            else
              random(board)
              end
              "#{move_index+1}"
            end

    def take_middle(board)
      4 if board.turn_count < 4 && !board.taken?(5)
    end





  end
end
