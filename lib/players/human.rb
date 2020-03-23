require 'pry'

module Players

  class Human < Player

attr_accessor :name, :game

    @@quotes_of_battle = ["Tic-Tac-Toe is a game for kings... and for fools.   ~ Sun Tzu, `The Art of War`",
       "`The cosmos is made of BILLIONS and BILLIONS of Xs and Os.`   ~ Carl Sagan",
        "`I don't think Mr. Deschler killed your wife.`   ~ Lt. Det. Columbo",
        "`Tic Tac Toe is why I became an actor.`   ~ Clint Eastwood",
        "`Only punks choose O.`   ~ His Holiness the Dhali Llama"
    ]

    def initialize(token)
      super
@game
    end

    def move(board)
      puts "Its ya move #{self.name}"
      puts @@quotes_of_battle.sample
      choice = gets.chomp
      if board.valid_move?(choice) == true
        board.update(choice, self)
        choice
      else
        move(board)
      end
    end


  end

  class Computer < Player

attr_accessor :game

    def initialize(token)
      super
      @plays =[5,1,3,7,9,2,4,6,8]
    #  @game

    end

    def token
      @TOKEN
    end

    #def game=(game)
    #  @game = game
    #end

    WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [2,4,6],
     [0,4,8],
     [0,3,6],
     [2,5,8],
     [1,4,7],
    ]


    def move(board)
      double_check(board)

      find_win = @win_combos.detect {|h| h.values.count(" ") == 1}


      if find_win != nil
        index = find_win.key(" ").to_s
        win = index.to_i + 1
        board.update(win, self)
      else
        count = 0
        until board.valid_move?(@plays[count]) == true
          count += 1
        end
        if board.valid_move?(@plays[count]) == true
          board.update(@plays[count], self)
        end
      end

    end


    def ai_perspective(board)
      arr =   [
        {'0'.to_sym => board.cells[0][0], '1'.to_sym => board.cells[1][0], '2'.to_sym => board.cells[2][0]},
        {'3'.to_sym => board.cells[3][0], '4'.to_sym => board.cells[4][0], '5'.to_sym => board.cells[5][0]},
        {'6'.to_sym => board.cells[6][0], '7'.to_sym => board.cells[7][0], '8'.to_sym => board.cells[8][0]},
        {'2'.to_sym => board.cells[2][0], '4'.to_sym => board.cells[4][0], '6'.to_sym => board.cells[6][0]},
        {'0'.to_sym => board.cells[0][0], '4'.to_sym => board.cells[4][0], '8'.to_sym => board.cells[8][0]},
        {'0'.to_sym => board.cells[0][0], '3'.to_sym => board.cells[3][0], '6'.to_sym => board.cells[6][0]},
        {'2'.to_sym => board.cells[2][0], '5'.to_sym => board.cells[5][0], '8'.to_sym => board.cells[8][0]},
        {'1'.to_sym => board.cells[1][0], '4'.to_sym => board.cells[4][0], '7'.to_sym => board.cells[7][0]},
      ]
    end

    def double_check(board)
      @win_combos = ai_perspective(board)

      @win_combos.each do |hash|
        if hash.values.include?("X") && hash.values.include?("O")
          @win_combos.delete(hash)
        end
      end

      @win_combos.each do |hash|
         if hash.values.include?("X") && hash.values.include?("O")
           @win_combos.delete(hash)
         end
       end

    end


#this is the END to computer
  end


end
