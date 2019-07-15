class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def cells
    @cells
  end
  
  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    
  end
  
  def position(input)
    @cells[input.to_i-1]
  end
  
  def full?
    @cells.all? do |cell|
      cell == 'X' || cell == 'O'
    end
  end
  
  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell == 'X' || cell == "O"
        counter += 1
      end
    end
    counter
  end
  
  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end
  
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end
  
  def update(input, player)
    cells[input.to_i-1] = player.token
  end
end