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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player

    if self.board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each  do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    position_1 = self.board.cells[win_index_1]
    position_2 = self.board.cells[win_index_2]
    position_3 = self.board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif
        position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combo
      elsif
        false
      end
    end
    if board.full?
      false
    end
  end

  def draw?
    if board.full? && self.won? == false
      true
    end
  end

  def over?
    if self.draw? || self.won?
      true
    else
      false
    end
  end

  def winner
    if self.over? && self.won?
      board.cells[self.won?[0]]
    else
      nil
    end
  end

  def turn
    user_input = self.current_player.move(self.board)
    if self.board.valid_move?(user_input)
      board.update(user_input, self.current_player)
    else
      self.current_player.move(self.board)
    end
  end

  def play
    until self.over? do
      self.turn
    end
    if self.winner == "X"
      puts "Congratulations X!"
    elsif self.winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end


end
