module Human::Players           #module inherits from Player Class  NAMESPACE HERE
  def move(board, timer = 0)
    puts "Please enter 1-9:"
    gets.chomp
  end
end
