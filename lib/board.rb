require 'pry'
class Board

    attr_accessor :cells

    def initialize
       reset!
    end

    def reset!
        self.cells = Array.new(9, " ")
    end
    
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end
    
    def position(pos)
        self.cells[pos.to_i-1]
    end
    
    def full?
        return true if self.cells.include?(" ") == false
    end
    
    def turn_count
        9-self.cells.count(" ")
    end
    
    def taken?(pos)
        if self.cells[pos.to_i-1] == "X" || self.cells[pos.to_i-1] == "O"
            true
        else
            false
        end
    end
    
    def valid_move?(pos)
        return true if pos.to_i.between?(1, 9) && self.cells[pos.to_i-1] == " "
    end
    
    def update(pos,myplayer)
        self.cells[pos.to_i-1] = myplayer.token
    end
        
end
