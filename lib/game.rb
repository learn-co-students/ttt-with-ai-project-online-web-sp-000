class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    @board=board
    @player_1=player_1
    @player_2=player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1=win_combination[0]
      win_index_2=win_combination[1]
      win_index_3=win_combination[2]
      board.cells[win_index_1]==board.cells[win_index_3]&&board.cells[win_index_3]==board.cells[win_index_2]&&board.cells[win_index_1]!=" "
    end
  end

  def draw?
    board.full?&&!won?
  end

  def over?
    draw?||won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  # def turn
  #   if !board.valid_move?(current_player.move(board))
  #     turn
  #   else
  #     board.update(current_player.move(board), current_player)
  #   end
  # end

  # def turn
  #    player = current_player
  #    current_move = player.move(@board)
  #    if !@board.valid_move?(current_move)
  #      turn
  #    else
  #      puts "Turn: #{@board.turn_count+1}\n"
  #      @board.display
  #      @board.update(current_move, player)
  #      puts "#{player.token} moved #{current_move}"
  #      @board.display
  #    end
  #  end

  def turn
    current_move=current_player.move(board)
    if !board.valid_move?(current_move)
      turn
    else
      board.display
      board.update(current_move,current_player)
    end
  end


  def play
  end

end
