module PlayMode

  def ask_mode
    puts "What mode would you like to play in, 0, 1, or 2 player? (0,1,2)"
    case gets.chomp.downcase
    when "0" || "zero"
      0
    when "1" || "one"
      1
    when "2" || "two"
      2
    else
      puts "Sorry, I don't have that mode"
      self.ask_mode
    end
  end

  def set_mode
    case self.ask_mode
    when 0
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    when 1
      Game.new(Players::Human.new("X"), Players::Computer.new("O"))
    when 2
      Game.new
    end
  end
end
