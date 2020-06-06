class Board
  attr_accessor :cells #stores the data of the state of the board in an array

  @cells = [] #array of data

  def reset! #can reset the state of the cells to what a board should look like at the start of a game, with an array of 9 elements.
    self.cells = Array.new(9, " ") #Board.cells = new board of 9 spaces.
  end

  def initialize #game initializes with an ability to reset the game every time the game is over, sets the board to a 9 element array
    self.cells = Array.new(9, " ")
  end

  def display #prints out the board at its current state
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(user_input) #takes in user input and returns the value of the board cell
    self.cells[user_input.to_i-1] #1-9 strings, cell array's index
#expect(board.position("1")).to eq("O")

  end

  def full? #returns true for a full board, returns false for an in progress game
#a board can return values based on its state when entirely occupied with X and Os.
#based on how many positions in the cells array are filled.
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count #returns the amount of turns baseed on a call value
    self.cells.count("X") + self.cells.count("O")
  end

  def taken?(position) #check board position, returns true if position is X or O. returns T or F for an individual position.
    self.cells[position.to_i-1] == "X" || #board position -1 because of test using range 1-9 (user input numbers)
    self.cells[position.to_i-1] == "O" #returns false if position is empty or blank
  end

  def valid_move?(position) #returns true for user input between 1-9. Returns true that that move is not taken.
  !taken?(position) && position.to_i >0 && position.to_i <=9
#if position is not taken, and position index is greater than 0, and position is less than or equal to 9
  end

  def update(position, player) #updates the cells in the board with the player token according to the input
      self.cells[position.to_i-1] = player.token #call token method when you update the appropriate index in the cells.
  end


end

#self refers to the board here.
