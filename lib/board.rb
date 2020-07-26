class Board

    attr_accessor :cells

    def initialize
        self.reset!
    end

def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
end

def display
  puts " #{@cells[0]} " + "|" + " #{@cells[1]} " + "|" + " #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} " + "|" + " #{@cells[4]} " + "|" + " #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} " + "|" + " #{@cells[7]} " + "|" + " #{@cells[8]} "
end

def input_to_index(input)
    index = input.to_i - 1
end

def position(input)
@cells[input_to_index(input)]
end

def full?
    @cells.all? {|cell| cell != " "}
end

def turn_count
    @cells.count {|cell| cell != " "}
end

def taken?(input)
    @cells[input_to_index(input)] == "X" || @cells[input_to_index(input)] == "O"
end

def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
end

def update(input, player)
    @cells[input_to_index(input)] = player.token
end



end