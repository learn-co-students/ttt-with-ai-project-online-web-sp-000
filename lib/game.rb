require 'pry'

class Game
  #extend Players::Human
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize (player_1=nil, player_2 = nil, board = nil)
    @board = board || Board.new
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
  end

  def current_player
    if board.cells.count{|x| x == "O" || x == "X"}.even?
      player = @player_1
    else
      player = @player_2
    end
    player
  end

  def won?
    WIN_COMBINATIONS.each do |x|
      if (@board.cells[x[0]] == @board.cells[x[1]]) and (@board.cells[x[1]] == @board.cells[x[2]])
        if (@board.cells[x[0]] == "O") or (@board.cells[x[0]] == "X")
          return x
        end
      end
    end
    false
  end

  def draw?
    board.full? and (not won?)
  end

  def over?
    false
    if won? || draw?
       true
    end
  end

  def winner
    if won? != false
      win_play = @board.cells[won?[0]]
    else
      win_play = nil
    end
    win_play
  end

  def turn
    #binding.pry
    input = 10
    while board.valid_move?(input) == false
      board.display
      puts "Player #{current_player.token}, what position would you like?"
      input = current_player.move(@board).to_i
    end
    board.update(input, self.current_player)
    # if board.valid_move?(input)
    #   board.update(input, current_player)
    # else
    #   board.display
    #   puts "Invalid move. Please select another position."
    #   turn
    # end
  end

  def play
    while (not over?)
      turn
    end

    if won? && winner == "X"
      board.display
      puts "Congratulations X!"
    elsif won? && winner == "O"
      board.display
      puts "Congratulations O!"
    elsif draw?
      board.display
      puts "Cat's Game!"
    else
    end
  end
end
