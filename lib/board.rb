class Board

    attr_accessor :cells

    def reset!
        @cells.clear
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def initialize
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(board_position)
        board_position = board_position.to_i
        board_position -= 1
        cells[board_position]
    end

    def full?
        @cells.all? { |cell| cell != " "}
    end

    def turn_count
        @cells.count { |cell| cell != " "}
    end

    def taken?(board_position)
        value = position(board_position)
        if value == "X" || value == "O"
            true
        else
            false
        end
    end

    def valid_move?(board_position)
        if board_position.to_i > 0 and board_position.to_i < 10
            if self.taken?(board_position)
                false
            else
                true
            end
        else
            false
        end
    end

    def update(cell, player)
        if self.valid_move?(cell)
            @cells[cell.to_i - 1] = player.token
        end
    end
end

