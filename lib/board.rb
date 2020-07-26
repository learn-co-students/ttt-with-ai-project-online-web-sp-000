class Board 
  attr_accessor :board, :cells

  def initialize
    self.reset!
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input) #returns the value in that position
    @cells[input.to_i - 1 ]
  end

  def full?
    @cells.none? {|c| c == " "}
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def taken?(input)
    @cells[input.to_i - 1] != " "
  end

  def valid_move?(input)
    cell = input.to_i
    cell >= 1 && cell <=9 && !taken?(input)
  end

  def update(input, player)
    if valid_move?(input)
      self.cells[input.to_i - 1] = current_player
    else
      "invalid move"
    end
  end


end
