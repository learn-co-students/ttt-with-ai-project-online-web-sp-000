def start
  puts "Welcome to Tic Tac Toe!"
  puts "How many players?"
  puts "0, 1 , 2"
  input
  select_mode
end

def select_mode(input)
    if input == 0
      ai_v_ai
    elsif input == 1
      single_player
    elsif input == 2
      two_player
    else
      puts "Please select 0, 1 or 2"
      input
  end
end

def input(user_input)
    input = gets
end
  
