class Game
  attr_accessor :board, :player_1, :player_2, :cells
  WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]

  ]

  def initialize(player1=Players::Human.new("X"),player2=Players::Human.new("O"),board = Board.new)
      @player_1 = player1
      @player_2 = player2
      @board = board
    end

    def current_player #returns the correct player X for 3rd move
      board.turn_count.even? ? player_1 : player_2
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
      combo.all? { |position| board.cells[position] == player_1.token } ||
      combo.all? { |position| board.cells[position] == player_2.token }
      end
    end
    def over?
      won?||draw?
    end
    def draw?
      !won? && board.full?
    end
    def winner
      board.cells[won?.first] if won?
    end

    def turn
      player = current_player
      current_move = player.move(board)
      if board.valid_move?(current_move)
        board.update(current_move, player)
        board.display
      else
        turn
      end
    end

    def play #conratulate winner/cats game on draw
      turn until over?
      puts "Congratulations #{winner}!"
      puts "Cat's Game!" if draw?
    end



end
