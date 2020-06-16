class Board

    attr_accessor :cells

    # Starts each board instance with a fully empty board.
    def initialize
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    # Empties the game board back to the starting position.
    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    # Displays the game board, using @cells to fill in the board spaces.
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    # Takes user input of 1-9 for board spaces and changes it to the corrent index for the corresponding space.
    def position(pos_num)
        @cells[pos_num.to_i - 1]
    end

    # Checks to see if gameboard is full by looking if there are no empty spaces.
    def full?
        @cells.none? {|cell| cell == "" || cell == " "}
    end

    # Finds all "X"s and "O"s and counts them to find current turn count.
    def turn_count
        @cells.find_all {|cell| cell == "X" || cell == "O"}.length
    end

    # Checks a given board position. Converts it to the appropriate index and checks if there is an "X" or "O".
    def taken?(pos_num)
        @cells[pos_num.to_i - 1] == "X" || @cells[pos_num.to_i - 1] == "O" ? true : false
    end

    # Converts input to index. Checks to make sure input is between 1 and 9.
    # Then checks corresponding board space to see it is already occupied.
    def valid_move?(input)
        input_to_int = input.to_i
        int_to_index = input_to_int - 1
        # binding.pry
        if input_to_int < 1 || input_to_int > 9
            puts 'invalid'
            false
        elsif input_to_int >= 1 && input_to_int <= 9 && @cells[int_to_index] != "X" && @cells[int_to_index] != "O"
            true
        end
    end

    # Takes user input and a player instance, then updates the board with the correct player token.
    def update(input, player)
        # binding.pry
        @cells[input.to_i - 1] = player.token
        self.position(input)
    end

end