class Board
  attr_accessor :cells
  CORNERS_INDEXS=[0,2,6,8]

  def initialize
    reset!
  end

  def reset!
    @cells=Array.new(9," ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(number)
    cells[number.to_i-1]
  end

  def update(number,player)
    cells[number.to_i-1]=player.token
  end

  def taken?(number)
    position(number)!=" "
  end

  def valid_move?(number)
    number.to_i.between?(1,9)&&!taken?(number)
  end

  def available_corner_index
    CORNERS_INDEXS.detect {|corner_index| cells[corner_index]==" " }
  end

  def check_about_to_win?
    Game::WIN_COMBINATIONS.detect do |win_combination|
      win_index_1=win_combination[0]
      win_index_2=win_combination[1]
      win_index_3=win_combination[2]
      to_win=[]
      to_win<<cells[win_index_1]
      to_win<<cells[win_index_2]
      to_win<<cells[win_index_3]
      to_win.count(" ")==1&&to_win.uniq.length==2
    end
  end

  def opponent_token(player)
    ["O","X"].reject {|x|x==player.token}[0]
  end

  def possible_winner_token
    index=check_about_to_win?.detect {|x| x!=" "}
    cells[index]
  end

  def win_or_lose_move
    index=check_about_to_win?.detect{|x|cells[x]==" "}
    check_about_to_win?.detect {|x| x!=" "}
  end

  def win_or_lose_move
    index=check_about_to_win?.detect{|x|cells[x]==" "}
    (index+1).to_s
  end

  def full?
    cells.all? {|cell| cell!=" "}
  end

  def turn_count
    cells.count {|cell| cell!=" "}
  end

end
