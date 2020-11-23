class Board
    attr_accessor :cells

    def initialize
        @cells = []
        reset!
    end

    def reset!
        @cells.replace(Array.new(9, " "))
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    # def input
    #     gets.strip.to_i - 1
    # end
    
    def position(choice)
        # cell_choice = gets.strip
        @cells[choice.to_i - 1]
    end

    def update(choice, player)
        @cells[choice.to_i - 1] = player.token
    end

    def full?
        @cells.all?{|c| c == "X" || c == "O"}
    end

    def turn_count
        @cells.select{|c| c == "X" || c == "O"}.length
    end

    def taken?(index)
        if @cells[index] == "X" || @cells[index] == "O"
          true
        else
          false
        end
    end

    def valid_move?(index)
        if (0..8).to_a.include?(index.to_i) && (!(taken?(index)))
            true
        else
            false
        end
    end
      


end