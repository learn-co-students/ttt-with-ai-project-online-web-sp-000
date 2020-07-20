class Board

  attr_accessor :cells

  def initialize
    @cells=Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts " -----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts " -----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(choice)
    cells[choice.to_i - 1]
  end

  def full?
    !cells.any?{|c| c == " "}
  end

  def turn_count
    counter = 0
    cells.each do |c|
      if c == "X" || c == "O"
      counter += 1
      end
    end
    counter
  end

  def taken?(position)
    cells[position.to_i-1] == "X" || cells[position.to_i-1] == "O"
  end

  def valid_move?(input)
    1.upto(9).include?(input.to_i) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token #lookup double method for rspec https://apidock.com/rspec/Spec/Mocks/ExampleMethods/double
  end

end
