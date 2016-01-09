class Player 
  attr_accessor :name, :lives, :points

  def add_point
    self.points -= 1
  end

  def subtract_life
    self.points += 1
  end
end



