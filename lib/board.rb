class Board
    attr_accessor :cells
   
    def initialize
        @cells =  Array.new(9, " ")
     
    end

    def cells
        @cells
       
    end

    def reset! 
         @cells = Array.new(9, " ")
  
# binding.pry
  
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
     end

    def position(number)
        number = number.to_i
        number -= 1
        @cells[number]  
    end

    def full?
        @cells.each do |e|
            if e == " "
                return false
            end
            true
        end
    end

    def turn_count
            count = 9
            @cells.map do |e|
                if e == " "
                    count -= 1
                end
                # binding.pry
            end
            count
    end

    def taken?(number)
        pos = position(number)
        if pos == " "
            return false
        end
            true
    end

    def valid_move?(number)
        if number.length > 1
            return false
        end
        number = number.to_i
        if number < 0 && number > 10
            return false
        elsif taken?(number)
            return false
        end
        true
    end
    
    def update(number, letter)
        number = number.to_i
        number -= 1
        cells[number] = letter.token
        token = letter.token
        # binding.pry
    end

end