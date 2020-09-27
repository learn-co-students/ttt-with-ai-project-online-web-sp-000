class Board
  require 'pry'
  attr_accessor :cells 
  
  def initialize()  #set cells of board to 9 element array of empty strings, instaed of doing the same thing as whats in the reset! method, we just need to call our reset! method
    reset!
  end   
  
  def reset!  #need to clear out cells instance variables 
      #the exclamation point doesn't necessarilly matter, it's like having the   '?' at the end of the method name, it's just checking for true or false. an '!' is indicative of forcing something to happen
    @cells = Array.new(9, " ") #want to reset the array of cells on the board; want to clear the array holding all of our positions
  end 
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} |"
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} |"
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} |"
  end 
  
  def position(input) #input is the number we're getting from the user 
    cells[input.to_i-1] #what we're getting as input is in a string form, so we use .to_i to change it to an integer and then subtracts it by 1 for the array index 
  end 
  
  def full?
    # cells.nil? would always return true, so it wouldnt work
    # '.all?' sends the iteration through a loop and checks to see that every single one of the array positions you're looking at has what your conditions are
    # if all of the cells return true for having "X" or "O" in it then the method returns true, otherwise it returns false because the board is not full
    # cells.all?{|character| character == "X" || "O" }
    # we tried the above code and it wasnt doing exactly what we wanted so we used a simpler loop with the 'each' iterator
    cells.all? do |character| 
      if character == "X" || character == "O"
        true 
      else 
        false 
      end 
    end 
  end 
  
  def turn_count 
    cells.count
    cells.count{|char| char=="X" || char=="O"}
  end 
  
  def taken?(input)   # remember when methods have ? they return true or false 
  # we can do this one of two ways 
    if position(input)=="X" || position(input)=="O"
      true 
    else 
      false 
    end 
    # OR we can use the method below to check to see if our position isn't an empty string
    # !(position(input)==" " || position(input)=="") 
  end 
  
  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end 
  
  def update(input, player)
    cells[input.to_i-1] = player.token # stands for etiher X or O 
    # with cells[input.to_i-1] we're calling the input to a certain cell position on the board
    # we call player.token because in the spec file we have player=double("player", :token => "X"), so when we pass in player in the method the player variable has both the "player" value and the value for :token, which stood for "X" and that's why this one passed
  end 
  
end 