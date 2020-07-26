class Board 
    attr_accessor :cells

    def initialize 
       reset!
    end
    
    def reset!
       @cells = Array.new(9, " ")
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------\n"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------\n"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position (location)
        @position = cells[location.to_i-1]
        @position    
    end

    def full?
        cells.all? {|string| (string == "X" ||string == "O")} 
    end

    def turn_count
        counter = 0 
        cells.each do |move|
          if move =="X" || move =="O"
            counter +=1 
          end
        end
        counter
    end

    def taken? (location)
        position(location) =="X" || position(location) == "O"
    end

    def valid_move?(location)
        location.to_i.between?(1,9) && !taken?(location)
    end

    def update(location, player)
        cells[location.to_i-1] = player.token
    end
end