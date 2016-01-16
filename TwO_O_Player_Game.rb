require 'colorize'
class Player 
  attr_accessor :name, :lives, :points
  def initialize(name)
        @name = name
        @lives= 3
        @points = 0
    end

  def add_point
    self.points += 1
  end

  def subtract_life
    self.lives -= 1
  end

end

class NonNumericAnswer < StandardError  
end

class NotValidPlayerName < StandardError
end


def start_game
  puts "Welcome To The Math Game ! ! !"
  begin
    print "PLAYER ONE: ENTER YOUR NAME > "
    player_one_name = gets.chomp
    raise NotValidPlayerName, 'Argument is not a proper name' unless player_one_name.match(/^[a-zA-Z]+$/)
  rescue NotValidPlayerName => e
    puts "THIS IS NOT A VALID NAME. PLEASE TRY AGAIN....".colorize(:red)
    retry
  end
  puts ""
  begin
    print "PLAYER TWO: ENTER YOUR NAME > "
    player_two_name = gets.chomp
    raise NotValidPlayerName, 'Argument is not a proper name' unless player_two_name.match(/^[a-zA-Z]+$/)
  rescue NotValidPlayerName => e
    puts "THIS IS NOT A VALID NAME. PLEASE TRY AGAIN....".colorize(:red)
    retry
  end

  puts ""

  @player_one = Player.new(player_one_name)
  @player_two = Player.new(player_two_name)
  @current_player = @player_one
 
  
  while true
    puts "#{@current_player.name}: POINTS -> #{@current_player.points}    LIVES: #{@current_player.lives}"
    first_number = random_number
    second_number = random_number
    
    begin
      puts "#{@current_player.name}, What does #{first_number} plus #{second_number} equal?"
      answer = gets.chomp
      raise NonNumericAnswer, 'Argument is not numeric' unless answer.match(/^\d+$/)
    rescue NonNumericAnswer => e
      puts "NOT A VALID NUMERIC ANSWER. PLEASE TRY AGAIN".colorize(:red)
      retry
    end

    check_answer(answer, first_number, second_number, @current_player)
    winner?
    break if @player_one.lives == 0 || @player_two.lives == 0
    @current_player == @player_one ? @current_player = @player_two : @current_player = @player_one
  end
end



def winner?
  if @player_one.lives == 0
    puts "PLAYER 2 WINS! ! !".colorize(:magenta)
  end
   if @player_two.lives == 0
    puts "PLAYER 1 WINS! ! !".colorize(:magenta)
  end
end
def check_answer(answer, num1, num2, player)
#Checks if the answer to the addidion is correct or wrong and notifies the player
 
  
  if answer.to_i == num1 + num2
      player.add_point
      puts "CORRECT!".colorize(:green)
    else
      player.subtract_life
      puts "WRONG!".colorize(:red)
    end
end
 

def random_number
#Generates a random number between 1 and 20  
  return rand(20) + 1
end


start_game