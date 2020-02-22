class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
      @cells.all? do |spot|
        spot != " "
      end
  end

  def turn_count
    count_array = []
    count_array = @cells.select {|cell| cell != " "}
    count_array.length
  end

  def taken?(location)
    @cells[location.to_i - 1] == "X" || @cells[location.to_i - 1] == "O"
  end

  def update(position_wanted, player)
    board_cell = position_wanted.to_i - 1
    @cells[board_cell] = player.token
  end

  def valid_move?(location)
    move = location.to_i - 1
    move.between?(0,10) && !taken?(location)
  end

  def move(board, location, current_player = "X")
    board[location] = current_player
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    location = input.to_i-1
    if valid_move?(board, location)
      move(board, location)
      display_board(board)
    else
      turn(board)
    end
  end

  # Define your play method below
  def play(board)
    9.times do |variable|
      turn(board)
    end
  end

end
