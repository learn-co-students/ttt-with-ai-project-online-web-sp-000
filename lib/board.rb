require 'pry'

class Board

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Top column
    [1,4,7], # Middle column
    [2,5,8], # Bottom column
    [0,4,8], # Diag A
    [6,4,2], # Diag B
  ]

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def position(input)
    @cells[input_to_index(input)]
  end

  def full?
    return_value = true
    @cells.each do |index|
      if (index.nil? || index == " ")
        return_value = false
      end
    end
    return_value
  end

  def turn_count
    counter = 0
    @cells.each do |index|
      if !(index.nil? || index == " ")
        counter += 1
      end
    end
    counter
  end

  def taken?(index)
    !(@cells[index.to_i-1].nil? || @cells[index.to_i-1] == " ")
  end

  def near_win?
    target_index = nil
    WIN_COMBINATIONS.each do |win_state|
      occupied_x = 0
      occupied_o = 0
      empty_index = " "
      win_state.each do |index|
        if @cells[index] == "X"
          occupied_x += 1
        elsif @cells[index] == "O"
          occupied_o += 1
        else
          empty_index = index
        end
      end
      if (occupied_x == 2 && occupied_o == 0) || (occupied_x == 0 && occupied_o == 2)
        target_index = empty_index
      end
    end
    target_index
  end

  def valid_move?(input)
    index = input_to_index(input)
    if ( index.between?(0,8) && taken?(index+1) == false)
      return true
    end
  end

  def update(input,player)
    index = input_to_index(input)
    @cells[index.to_i] = player.token
   end
end
