class Board
   attr_accessor :cells

   def initialize
     @cells=[" "," "," "," "," "," "," "," "," "]
   end

   def reset!
     @cells=[" "," "," "," "," "," "," "," "," "]
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
    #@cells.all?{|cell|cell!=" "}
    @cells.none?{|cell|cell==" "}
  end

  def turn_count
    @cells.select {|cell|cell!=" "}.size
  end

  def taken?(input)
    if position(input)==" "
      false
    else true
    end
  end

  def valid_move?(input)
    if input.to_i<=9 && input.to_i>=1 && !taken?(input)
      true
    end
  end

  def update(input,player)
    @cells[input.to_i-1]=player.token
  end
end
