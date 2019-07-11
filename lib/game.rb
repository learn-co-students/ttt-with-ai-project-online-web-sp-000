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
    [2,4,6]
  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X"
        return win_combo
      elsif
        board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O"
        return win_combo
      else
        false
      end
    end
    false
  end
  def full?
    board.cells.none?{|i| i == " "}
  end
  def draw?
    won? == false && full? == true
  end
  def over?
    won? || draw?
  end
  def winner
    won? == false ? nil : board.cells[won?[0]]
  end
  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end
  def play
    while over? == false
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

  def play_single
    while over? == false

      if board.turn_count.even?
        turn
      else
        input = Random.rand(-1...9)
        if board.valid_move?(input)
          board.update(input, current_player)
          board.display
          play_single
        else
          play_single
        end
      end

    end
    if draw? == true
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

  def play_computers
    while over? == false
      input = Random.rand(-1...9)
      if board.valid_move?(input)
        board.update(input, current_player)
        board.display
        sleep(1)
        play_computers
      else
        play_computers
      end
    end
    if draw? == true
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

  def self.start
    puts "How many are playing? 0, 1, 2"
    input = gets.strip
    player_1 = nil
    player_2 = nil

    if input == "0"
      player_1 = Players::Computer.new("O")
      player_2 = Players::Computer.new("X")
      Game.new(player_1, player_2).play_computers

    elsif input == "1"
      puts "Would you like to be 'X' or 'O'?"
      input = gets.strip
      if input == "X"
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
      else
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
      end
      Game.new(player_1, player_2).play_single

    elsif input == "2"
      puts "You decide who goes first then type: 'X'"
      input = gets.strip
      if input == "X"
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
      else
        player_1 = Players::Human.new("X")
        player_2 = Player::Human.new("O")
      end
      Game.new(player_1, player_2).play

    end

  end


end
