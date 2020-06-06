#Represents a singular instance of a TicTacToe session.
class Game

  attr_accessor :board, :player_1, :player_2, :winner, :user_input

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6] ]

#Initialize accepts two players and a board. Player 1 = class Human that inherits from the Player. Player 1 = X. Player 2 = O.
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new) #initializes with an empty board.
    @player_1 = player_1 #provides access to player 1
    @player_2 = player_2 #provides access to player 2
    @board = board #provides access to the board
    @board.display #access to board display
  end

#Returns current player X for the 3rd move. (Odd turn count)
#game.board.cells = ["O", " ", " ", " ", "X", " ", " ", " ", " "]
def current_player #it is player 2 turn, else, player 1
     board.turn_count.odd? ? player_2 : player_1
  end

  def won?
  #it 'returns false for a draw' do
  #game = Game.new
  #game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    WIN_COMBINATIONS.each do |combination|  #iterate through each winning combination
        if @board.cells[combination[0]] == @board.cells[combination[1]] &&
          @board.cells[combination[1]] == @board.cells[combination[2]] &&
          @board.taken?(combination[0]+1)
          #game.board.cells = ["O", "O", "O",
                            #  "X", "X", " ",
                            #  " ", " ", "X"]

        #  expect(game.won?).to contain_exactly(0, 1, 2)

          return combination
        end
      end
    return false
  end


  def draw? #returns true for a draw ELSE false for a win, or in progress game
    @board.full? && !won? ? true : false
#  game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"] true
#  game.board.cells = ["X", " ", "X", " ", "X", " ", "O", "O", "X"] false
  end


  def over?
     (won? || draw?) ? true : false
     # If board is not full, game is in progress, so FALSE
     # ELSE, game is over TRUE
  end

  def winner
    if won?
      combination = won? #check for winning combination
      @board.cells[combination[0]] # X or O, returns X when X is won, O when O is won
    end
  end

  def turn #when it is player 1 or 2 turn, prompt question:
    puts "Please enter a number 1-9:"
    #player user input = the current player makes a move on the board
    @user_input = current_player.move(@board)
    #if there is a valid move on the board, accept the user input
    if @board.valid_move?(@user_input)
#the board updates when there is user input from the current player, asks next player to go
      @board.update(@user_input, current_player)
#if there is no input, prompt the user to enter a number 1-9
    else puts "Please enter a number 1-9:"
#update board display
      @board.display
#call turn method, changes to player 2 after the first turn
      turn
    end
    #show new board display
    @board.display
  end

  def play
    turn until over? #ask for player input on turn of the game
    if won? #checks if someone won the game after every turn
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
