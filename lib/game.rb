class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
  def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    #why is board something passed in.... weird... do they pass in non-empty boards?
    #looks like it wants u to mdefault the players to be human players
    #that means if without arguments, u defualt to....

    #problem:
    #if u do PLayers::Human.new, it says undefined method `Human' for Players:Module
    #(btw this is when i do class Human < Player, no namespacing
    #if i do namespacing, class Players::Human < Player, it still says         undefined method `Human' for Players:Module
    #if u do Human.new it says uninitialized constant Game::Human as if human belong to game...

    end



    def current_player
      turns = @board.turn_count()

      if (turns % 2 == 0)
        return @player_1
      else
        return @player_2
      end
    end


    def won?
    WIN_COMBINATIONS.each do |combo|
      # if same value in this row/column/diag and not empty empty empty
      #@board.taken?(combo[0]+1) why the plus 1? becsause boar.dtaken takes 1-9, not 0 to 8
      if ( (@board.cells[combo[0]] == @board.cells[combo[1]]) &&  (@board.cells[combo[1]] == @board.cells[combo[2]] ) && @board.taken?(combo[0]+1) )
        return combo
      #critical:
      #do not put an else return nil here. or it will end the entire operation. only return nill if it's looped through EVERYTHING and still found nothing
      end
    end #end iteration
    return nil
  end

  def draw?
    if @board.full? && won? == nil
      return true
    else
      return false
    end
  end


  def over?
  if draw? || won?
    return true
  else
    return false
  end
  end

  def winner
  #ex: if winningcombo is [2,4,6], board[winningcombo[0]] = board[2] = either X or O
  winningcombo = won?
  if winningcombo == nil
    return nil
  else
    return @board.cells[winningcombo[0]]
  end
  end

  # def turn
  #   puts "Please enter 1-9:"
  #   input = gets.strip
  #   puts "the text is #{input}"
  # end


  def turn
    the_current_player = current_player()
    puts "Please enter 1-9:"

    index = the_current_player.move(@board) #this grabs the input

    if @board.valid_move?(index) #ai valid move is boar'ds method. and takes onetonine
      @board.update(index, the_current_player) #move in AI is def update(onetonine, playerobject)
      @board.display() #display_board in AI is Board's method

    else
      #put it in a loop
      inputnowvalid = false

      until inputnowvalid == true
        puts "Please enter 1-9:"
        getthenewmove = the_current_player.move(@board)

        inputnowvalid = @board.valid_move?(getthenewmove) #valid move in AI is Board's method. and takes onetonine
        #if vaid, input nowvalid becomes true. that will stop the loop.
        #othrewise, this keeps going forever
      end #end of loop

      #if loop is finished, take new move and send it in
      @board.update( getthenewmove, the_current_player) #move in AI is def update(onetonine, playerobject)
      @board.display() #in ai it's board's method. and named display.
    end #end of if & else

  end


  def winner
#ex: if winningcombo is [2,4,6], board[winningcombo[0]] = board[2] = either X or O
winningcombo = won?
if winningcombo == nil
  return nil
else
  return @board.cells[winningcombo[0]]
end
end


def play
  #A tic tac toe game must allow players to take turns, checking if the game is over after every turn, and at the conclusion of the game, whether because it was won or because it was a draw, reporting to the user the outcome of the game
  until over? do
    turn

  end

  if over?
    if won?
      puts "Congratulations #{winner()}!"
    else #aka a draw
      puts "Cat's Game!"
    end
  end
  #boardnotfull = (board.include?(" ") || board.include?(""))
  #variable must be inside so that e4very loop re calculate the value of boardisfull
  # otherwie it's static
  #crucial
  #if !boardnotfull
  #  break
  #end

end



end #end class
