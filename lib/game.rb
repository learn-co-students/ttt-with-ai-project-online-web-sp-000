class Game

    attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [1,4,7],
    [2,5,8],
    [0,3,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board 
    @player_1 = player_1
    @player_2 = player_2
    end

    def current_player
       @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.each do |win|
      
            win_1 = win[0]
            win_2 = win[1]
            win_3 = win[2]
  
            first_position = @board.cells[win_1]
            second_position = @board.cells[win_2]
            third_position = @board.cells[win_3]
     
        if first_position == "X" && second_position == "X" && third_position == "X" || first_position == "O" && second_position == "O" && third_position == "O"
                return win
            end          
         end
        false
    end

    def draw?
         @board.full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        if won?
            winner_arr = won?
           @board.cells[winner_arr[0]]
        else
            nil
        end
    end

    def turn
        player = current_player
        input = player.move(board)
        # binding.pry
        if @board.valid_move?(input)
            @board.update(input, player)
        else
            puts "Please input a number 1-9"
            player.move(board)
        end
    end

    def play
        while !over?
            turn 
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end