class Game
  
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
  
  #main model of app
  #represents a singular instance of tic tac toe session:
    #game has one board through board property
    #game has two Players stored in player_1 & player_2
  #Board & Player don't directly relate to Game but collaborate through arguments
  #provides basic game runtime and logic(see tests)
end