class Board

    attr_accessor :cells

    def initialize
        @cells = []
        self.reset!
    end

    def reset!
        @cells = []
        9.times do
            @cells.push(" ")
        end
    end

    def display
        cells = []
        rows = []
        separater = "-----------" + "\n"
        @cells.length.times do |i|
          cells[i] = " #{@cells[i]} "
        end
        for i in 0..2
          rows[i] = "#{cells[3*i]}" + "|" + "#{cells[3*i + 1]}" + "|" + "#{cells[3*i + 2]}" + "\n"
        end
        print rows[0], separater, rows[1], separater, rows[2]
    end

    def position(input)
        cells[input.to_i - 1]
    end

    def full?
        @cells.all?{|i| (i == "X" || i == "O")}
    end

    def turn_count
        turns = 0
        @cells.each do |square|
          if square == "X" || square == "O"
            turns += 1
          end
        end
        return turns
    end

    def taken?(index)
        index = index.to_i - 1
        if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
          return false
        elsif @cells[index] == "X" or @cells[index] || "O"
          return true
        end
    end

    def valid_move?(index)
        if index.to_i.between?(1,9) && (!taken?(index))
          return true
        else
          return false
        end
    end

    def update(index, player)
        index = index.to_i - 1
        @cells[index] = player.token
    end

end