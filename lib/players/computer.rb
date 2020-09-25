require 'pry'

module Players
  class Computer < Player
    def move(board)
      self.win(board) || self.block(board) || self.ffork(board) || self.block_fork(board) || self.center(board) || self.opposite_corner(board) || self.corner(board) || self.side(board)
    end
    
    def win(board, token = self.token)
      move = false
      
      Game::WIN_COMBINATIONS.each do |combination|
        token_count = 0
        
        combination.each do |index|
          token_count += 1 if board.position(index + 1) == token
        end
        
        if token_count == 2
          combination.each do |index|
            move = (index + 1).to_s if board.valid_move?(index + 1)
          end
        end
      end
      
      move
    end
    
    def block(board)
      if self.token == "X"
        self.win(board, "O")
      else
        self.win(board, "X")
      end
    end
    
    def winnable(board, opponent_token)
      winnable = []
      
      Game::WIN_COMBINATIONS.each do |combination|
        winnable << combination if !combination.collect {|index|board.position(index + 1)}.include?(opponent_token)
      end
      
      winnable
    end
    
    def started(board, token)
      opponent_token = self.opposite_token(token)
      
      winnable = self.winnable(board, opponent_token) #check which combinations don't include opponent's token
      
      started = []
      
      winnable.each do |combination|
        combination.find do |index|
          started << combination if board.position(index + 1) == token
        end
      end
      
      started
    end
    
    def valid_moves(board, combinations)
      valid_moves = []

      combinations.each do |combination|
        combination.each do |index|
          valid_moves << index if board.valid_move?(index + 1)
        end
      end
      
      valid_moves
    end
    
    def opposite_token(token)
      token == "X" ? "O" : "X"
    end

    def fork_moves(board, token = self.token)
      started = self.started(board, token) #check which combinations (of those winnable) do include own token
      
      valid_moves = self.valid_moves(board, started) #check which cells are empty in started/winnable combinations
      
      # get any fork_moves if one exists (valid moves that appear in more than one winnable and started combinations)
      
      fork_moves = valid_moves.select {|move| valid_moves.count(move) > 1}.uniq
      
      fork_moves.length > 0 ? fork_moves : nil
    end

    def ffork(board, token = self.token)
      fork_moves = self.fork_moves(board, token)
      
      (fork_moves[0] + 1).to_s if fork_moves != nil 

      # token == "X" ? opponent_token = "O" : opponent_token = "X"
      
      # # get the combinations that don't contain the opponent's token
      
      # winnable = []
      
      # Game::WIN_COMBINATIONS.each do |combination|
      #   winnable << combination if !combination.collect {|index|board.position(index + 1)}.include?(opponent_token) # get the tokens in the combination (.collect + board.position) and check if they include opponent_token; if not, add combination to winnable
      # end

      # # filter those combinations by ones with one self.token already placed

      # started = []
      
      # winnable.each do |combination|
      #   combination.find do |index|
      #     started << combination if board.position(index + 1) == token
      #   end
      # end
      
      # # from those combinations, get all the valid moves (duplicating any that appear in multiple winnable combinations)
      
      # valid_moves = []
      
      # started.each do |combination|
      #   combination.each do |index|
      #     valid_moves << index if board.valid_move?(index + 1)
      #   end
      # end
      
      # # get a fork if one exists (valid moves that appear in more than one winnable and started combinations)
      
      # index = valid_moves.find {|move| valid_moves.count(move) > 1}
      
      # (index + 1).to_s if index != nil
      
    end

    def block_fork(board, token = self.opposite_token(self.token))
      fork_moves = self.fork_moves(board, token)
      
      index = nil
      
      binding.pry
      
      if fork_moves != nil
        board_future = Board.new
        fork_moves.each do |fork_move|
          board_future.reset!
          board_future.cells = board.cells
          binding.pry
          board_future.update((fork_move + 1).to_s, self)
          binding.pry
          if self.fork_moves(board_future, token) != nil
            index = fork_move if self.fork_moves(board_future, token).length < 2
          end
        end
      end
      
      (index + 1).to_s if index != nil
      
      # binding.pry
      
      # started = self.started(board, token)

      # binding.pry
      
      # started_cells = started.flatten.uniq

      # binding.pry
      
      # (fork_moves.find{|move|started_cells.include?(move)} - 1).to_s if fork_moves != nil
      
      # if self.token == "X"
      #   self.ffork(board, "O")
      # else
      #   self.ffork(board, "X")
      # end
    end

    def center(board)
      if board.valid_move?(5)
        "5"
      end
    end

    def opposite_corner(board)
      opponent_token = "O"
      
      if self.token == "O"
        opponent_token = "X"
      end
      
      if board.position(1) == opponent_token
        "9"
      elsif board.position(3) == opponent_token
        "7"
      elsif board.position(7) == opponent_token
        "3"
      elsif board.position(9) == opponent_token
        "1"
      end
    end

    def corner(board)
      move = [1,3,7,9].find {|cell|board.valid_move?(cell)}
      move.to_s if move != nil
    end

    def side(board)
      move = [2,4,6,8].find {|cell|board.valid_move?(cell)}
      move.to_s if move != nil
    end
  end
end