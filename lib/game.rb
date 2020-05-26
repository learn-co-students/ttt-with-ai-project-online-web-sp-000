require 'pry'
class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1=nil, player_2=nil, board=nil)
      @player_1 = player_1 == nil ? Players::Human.new("X") : player_1
      @player_2 = player_2 == nil ? Players::Human.new("O") : player_2
      @board = board == nil ? Board.new : board
  end

  def current_player
    (@board.turn_count + 1) % 2 == 0 ? @player_2 : @player_1
  end
  
  # def won?
  #   WIN_COMBINATIONS.find do |combo|
  #     if @board.cells[combo[0]] == @board.cells[combo[1]] &&
  #       @board.cells[combo[0]] == @board.cells[combo[2]]
  #       return true
  #     else
  #       next
  #     end
  #     # binding.pry
  #   end
  #   false
  # end

  def won?
    WIN_COMBINATIONS.each do |combo|
      tokens = combo.map {|position| @board.cells[position]}
      if tokens.all? {|t| t == "X"} or tokens.all? {|t| t == "O"}
        return combo
      # else
      #   next
      end
    end
    false
  end

  def draw?
    @board.full? && won? == false
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    position = current_player.move(@board)
    if @board.valid_move?(position) == true
      @board.update(position, current_player)
    else
      until @board.valid_move?(position) == true
        position = current_player.move(@board)
      end
    end
  end
  
  def play
    # binding.pry
    running = true
    
    while running == true
      if over?
        running = false
        if won?
          # binding.pry
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      else
        turn
      end
    end
  end
  
  
  
end