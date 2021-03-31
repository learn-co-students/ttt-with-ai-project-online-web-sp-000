class Board
  
  attr_accessor :cells
  
  
  def initialize
    reset!
  end
  
  def reset!
    @cells = Array.new(9," ")
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "------------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "------------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    @input = input.to_i - 1
    @cells[@input]
  end
  
  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end
  
  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end
  
  def turn_count
    count = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    count
  end
  
  def taken?(input)
    if @cells[input.to_i - 1] == " "
      false
    else
      true
    end
  end
  
  def valid_move?(input)
    if input.to_i <= 9 && input.to_i >= 1 && !taken?(input)
      true
    else
      false
    end
  end
end