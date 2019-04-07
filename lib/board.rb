class Board
    attr_accessor :cells
    
    def initialize
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
      @cells.all?{|i| i!=" "}
    end
    
    def turn_count
      counter=0
      @cells.each do |i|
        if(i!=" ")
          counter+=1
        end
      end
      counter
    end
    
    def taken?(position)
       if(@cells[position.to_i-1]!=" ")
         true
       else
        false
       end
    end
    
    def valid_move?(position)
       if(position.to_i>=1 && position.to_i<=9 && @cells[position.to_i-1]==" ")
         true
       else
        false
       end
    end
    
    def update(input,player)
      @cells[input.to_i-1]=player.token
    end
    
    def reset!
      self.cells.clear
      self.cells=[" "," "," "," "," "," "," "," "," "]
    end
    
    
end

      