class Board
  #cells property stores data of board state in Array
  #reset! method resets state of cells to blank board
  #display method prints current state of board
  #position method takes in user input of "1-9" strings, looks up value of cells at according index. All other methods take this input and use #position to look up value according to array index
  #update method represents updating board after first move. Two arguments: position user wants to occupy (1-9 string converted to array index), and player object making move. Also updates approrpiate index in cells, set equal to token of player object by calling #token method
  #full? 
  #turn_count
  #taken?
  #valid_move?
end