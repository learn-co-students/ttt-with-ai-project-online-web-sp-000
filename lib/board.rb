class Board
  attr_accessor :cells
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input_from_user)
    pos_number = self.input_to_index(input_from_user)
    @cells[pos_number]
  end

  def full?
    if @cells.any?(" ")
      false
    else
      true
    end
  end

  def turn_count
    turns_taken = 0
    @cells.each do |cell|
      if cell != " "
        turns_taken += 1
      end
    end
    turns_taken
  end

  def taken?(input_from_user)
    if self.position(input_from_user) == " "
      false
    else
      true
    end
  end

  def valid_move?(input_from_user)
    number = input_from_user.to_i
    if number > 0 && number <= 9
      if !self.taken?(input_from_user)
        true
      end
    else
      false
    end
  end

  def update(input_from_user, player)
    @cells[input_to_index(input_from_user)] = player.token
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
    index
  end
end
