class Board
  
  attr_accessor :cells, :token, :player_1,:player_2, :player_1_input, :player, :game, :input
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display
    dashes = "-----------"
    
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts dashes
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts dashes
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts " \n\n"
  end
  
  def player_1
    @player_1 = Player.new(token = "X")
  end
  
  def player_2
    @player_2 = Player.new(token = "O")
  end
  
  def position(input)
    placement = input.to_i - 1
    @cells[placement]
  end
  
  def full?
    if @cells.any?(" ")
      false
    else
      true
    end
  end
  
  def turn_count
  x = @cells.count("X")
  o = @cells.count("O")
  #adding the X's and O's together to get the turn count
  turn = x + o
  end
  
  def taken?(input)
    if position(input) == " "
      false
    else
      true
    end
  end
  
  def valid_move?(input)
    #making sure the input is in the defined range
    if input.to_i <= 9 && input.to_i >= 1
      #now seeing if the valid number is taken on the board or not
      if taken?(input) == false
        true
      else
        false
      end
    else
      false
    end
  end
  
  def update(input, player)
    @game = Game.new(player_1, player_2, self)
    @player_1 = self.player_1
    @player_2 = self.player_2
    placement = input.to_i - 1
    
    if self.game.current_player.token == "X"
      self.cells[placement] = self.player_1.token
    else
      @cells[placement] = self.player_2.token
    end
  end
  
end