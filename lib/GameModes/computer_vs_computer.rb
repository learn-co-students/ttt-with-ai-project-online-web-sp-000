def ai_v_ai
  comp_1 = Players::Computer.new("X")
  comp_2 = Players::Computer.new("O")
  new_game = Game.new(comp_1, comp_2)
  new_game.play
end
