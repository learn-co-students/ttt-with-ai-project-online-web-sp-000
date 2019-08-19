class Board
  attr_accessor :cells

   def initialize
    reset!
  end

   def cells
    @cells
  end

   #When reset! method is called, it resets the 9 element array to ""
  def reset!
    self.cells = (Array.new(9, " "))
  end

   #Prints the board
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

   def position(position)
    index = input_to_index(position)
    cells[index]
  end

   def full?
    if cells.include? " " || nil
       return false
     else
       return true
     end
  end

   def turn_count
    counter= 0
    cells.each do|position|
      if (position=="X")
        counter+= 1
      elsif (position== "O")
        counter+= 1
      end
    end
   return counter
 end

   def taken?(num) #Returns false if the position is empty
    num = num.to_i - 1 if num.class == String
    !(cells[num].nil? || cells[num] == " ")
  end

   def valid_move?(position)
    new_position = input_to_index(position)
    new_position.between?(0,8) && !taken?(new_position)
  end

   def update(position, player)
    index = input_to_index(position)
    cells[index] = player.token
  end

   def input_to_index(user_input)
    user_input.to_i - 1
  end
end
