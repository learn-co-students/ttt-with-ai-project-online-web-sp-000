class Board
  attr_accessor :cells
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(cells = clean_board)
    @cells = cells
  end

  def clean_board
    Array.new(9, " ")
  end
  
  def reset!
    @cells = clean_board
  end

  def display
    puts ""
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(cell)
    return @cells[cell.to_i-1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    9 - @cells.count(" ")
  end

  def taken?(cell)
    @cells[cell.to_i-1] != (" ")
  end

  def taken_int?(cell)
    @cells[cell] != (" ")
  end

  def valid_move?(cell)
    cell.to_i > 0 && cell.to_i < 10 && !taken?(cell)
  end

  def update(cell, player)
    @cells[cell.to_i-1] = player.token if valid_move?(cell)
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|x| @cells[x] == "X"}
        return combo
      end
      if combo.all? {|x| @cells[x] == "O"}
        return combo
      end
    end
    return false
  end

  def draw?
    if (!won? && full?)
      return true
    end
    return false
  end

  def over?
    if (draw? || won?)
      return true
    end
    return false
  end

  def winner
    if won?
      return cells[won?[0]]
    end
    return nil
  end

  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end

  def other_player
    return turn_count % 2 == 0 ? "O" : "X"
  end
end