class Board
  
  attr_accessor :cells
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  
  DIAGONAL = [
    [2, 4, 6],
    [0, 4, 8]
  ]
  
  #first two indexes are potential winner, 3rd index is defender and 4th index is best move
  HALF_CROSS = [
    [1, 3, 4, 0],
    [1, 5, 4, 2],
    [3, 7, 4, 6],
    [5, 7, 4, 8]
  ]
  
  #first two indexes are potential winner, 3rd index is defender and 4th index is best move
  HORSE_SHAPE = [
    [0, 5, 4, 2],
    [1, 6, 4, 0],
    [2, 7, 4, 8],
    [3, 8, 4, 6]
  ]
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def display
    puts "        #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "  
    puts "       -----------"
    puts "        #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "       -----------"
    puts "        #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n\n"
  end
  
  def position(input)
    index = input.to_i - 1
    @cells[index]
  end
  
  def corner_move_available? #RETURNS INDEX OF AVAILABLE CORNER OTHERWISE FALSE
    corner_indexes = [0, 2, 6, 8]
    
    corner_indexes.each {|index| return index if @cells[index] == " "}
    false
  end
  
  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end
  
  def setup? #RETURNS INDEX IF ANY SETUPS PRESENT OTHERWISE FALSE
    if half_cross?
      return half_cross?
    elsif diagonal_sandwich?
      return diagonal_sandwich?
    elsif horse_shape?
      return horse_shape?
    elsif diagonal_sword?
      return diagonal_sword?
    else
      false
    end
  end
  
  def diagonal_sword? #RETURN BEST INDEX IF DIAGONAL SWORD IS PRESENT OTHERWISE FALSE
    DIAGONAL.each do |combination|
      #control for other_indexes depending on which diagonal
      if combination == [2, 4, 6]
        other_indexes = [0, 8]
      else
        other_indexes = [2, 6]
      end
      
      index1 = combination[0]
      index2 = combination[1]
      index3 = combination[2]
      if (@cells[index1] == "X" && @cells[index2] == "X" && @cells[index3] == "O") ||
        (@cells[index1] == "O" && @cells[index2] == "X" && @cells[index3] == "X") ||
        (@cells[index1] == "O" && @cells[index2] == "O" && @cells[index3] == "X") ||
        (@cells[index1] == "X" && @cells[index2] == "O" && @cells[index3] == "O")
        if other_indexes.all? {|index| @cells[index] == " "}
          return other_indexes.sample(1)[0] #return random side move if DS present
        end
      end
    end
    false
    
  end
  
  def horse_shape? #RETURNS INDEX OF BEST MOVE IF HORSE SHAPE PRESENT OTHERWISE RETURN FALSE
    HORSE_SHAPE.each do |combination|
      index1 = combination[0]
      index2 = combination[1]
      index3 = combination[2]
      index4 = combination[3]
      if (@cells[index1] == "X" && @cells[index2] == "X" && @cells[index3] == "O" && @cells[index4] == " ") ||
        (@cells[index1] == "O" && @cells[index2] == "O" && @cells[index3] == "X" && @cells[index4] == " ")
        return index4
      end
    end
    false
  end
  
  
  def half_cross? #RETURNS INDEX OF BEST MOVE IF HALF CROSS PRESENT OTHERWISE RETURN FALSE
    HALF_CROSS.each do |combination|
      index1 = combination[0]
      index2 = combination[1]
      index3 = combination[2]
      index4 = combination[3]
      if (@cells[index1] == "X" && @cells[index2] == "X" && @cells[index3] == "O" && @cells[index4] == " ") || 
        (@cells[index1] == "O" && @cells[index2] == "O" && @cells[index3] == "X" && @cells[index4] == " ")
        return index4
      end
    end
    false
  end
  
  def diagonal_sandwich? #RETURNS INDEX OF BEST MOVE IF DS PRESENT OTHERWISE RETURNS FALSE

    DIAGONAL.each do |combination|
      #control for other_indexes depending on which diagonal
      if combination == [2, 4, 6]
        other_indexes = [1, 3, 5, 7, 0, 8]
      else
        other_indexes = [1, 3, 5, 7, 2, 6]
      end
      
      index1 = combination[0]
      index2 = combination[1]
      index3 = combination[2]
      if (@cells[index1] == "X" && @cells[index2] == "O" && @cells[index3] == "X") ||
        (@cells[index1] == "O" && @cells[index2] == "X" && @cells[index3] == "O")
        if other_indexes.all? {|index| @cells[index] == " "}
          return [1, 3, 5, 7].sample(1)[0] #return random side move if DS present
        end
      end
    end
    false
  end
  
  def win_imminent? #RETURNS COMBINATION FOR ALMOST WIN
  #  WIN_COMBINATIONS = [
  #    [0, 1, 2],
  #    [3, 4, 5],
  #    [6, 7, 8],
  #    [0, 3, 6],
  #    [1, 4, 7],
  #    [2, 5, 8],
  #    [0, 4, 8],
  #    [2, 4, 6]
  #    ]
      
    WIN_COMBINATIONS.each do |combination|
      index1 = combination[0]
      index2 = combination[1]
      index3 = combination[2]
      
      #checking for 2 in a row and empty in winning combination indexes OR 2 in first and 3rd and empty middle
      if (@cells[index1] == "X" && @cells[index2] == "X" && @cells[index3] == " ") || (@cells[index1] == " " && @cells[index2] == "X" && @cells[index3] == "X") || (@cells[index1] == "X" && @cells[index2] == " " && @cells[index3] == "X") || (@cells[index1] == "O" && @cells[index2] == "O" && @cells[index3] == " ") || (@cells[index1] == " " && @cells[index2] == "O" && @cells[index3] == "O") || (@cells[index1] == "O" && @cells[index2] == " " && @cells[index3] == "O")
        return combination
      end
    end
    false
  end
  
  def turn_count
    counter = 0
    @cells.each do |cell|
      counter += 1 if cell == "X" || cell == "O"
    end
    counter
  end
  
  def taken?(input)
    if @cells[input.to_i - 1] == " "
      false
    else
      true
    end
  end
  
  def valid_move?(input)
    #input is between 1 and 9 and is not taken
    if input.to_i.between?(1, 9) && !taken?(input)
      true
    else
      false
    end
  end
  
  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
end