class Board
  attr_accessor :cells
  
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(location)
    @cells[location.to_i - 1]
  end
  
  def full?
    is_full = @cells.none? do |cell|
    
    if cell == " "
        true
      else
        false
      end
    end 
    
    return is_full
  end
  
  def turn_count
    counter = 0;
    
    @cells.each {|spot|
      if spot == "X" || spot == "O"
        counter += 1
      end
    }
    return counter
  end
  
  def taken?(location)
    position(location) != " " && position(location) != ""
  end
  
  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end
  
  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end
end