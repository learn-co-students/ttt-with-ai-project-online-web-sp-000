require 'pry'

class Board


  def initialize
    #binding.pry
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def cells=(cells)
    @cells = cells
  end

  def reset!
    cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)

    if (1..cells.length).include?(user_input.to_i)
      cells[user_input.to_i - 1]
    end
    #binding.pry
  end

  def full?
    cells.all?{|token| token == "X" || token == "O"}
    #binding.pry
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      return true
    else
      return false
    end
    #binding.pry
  end

  def valid_move?(input)
    #binding.pry
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(index, player)
    #binding.pry
    cells[index.to_i-1] = player.token

  end








end
