@player_one = {
      id: 1,
      lives: 3,
      points: 0
}
@player_two = {
      id: 2,
      lives: 3, 
      points: 0
}

def initiate_game
#Called in order to initiate the game state and keep game alive until a player has zero lives
end

def winner?
#Checks whether a one of two players have won
if @player_one[:lives] == 0
    puts "PLAYER 2 WINS! ! !"
  end
   if @player_two[:lives] == 0
    puts "PLAYER 1 WINS! ! !"
  end
end

def game_over?(p1, p2)
 #Checks if either player has zero lives to decide if game is over. 
 return p1[:lives] == 0 || p2[:lives] == 0
end

def check_answer(answer, num1, num2, current_player_id)
#Checks if the answer to the addidion is correct or wrong and notifies the player
  if answer == num1 + num2
      add_point(current_player_id)
      puts "CORRECT!"
      return true
    else
      subtract_life(current_player_id)
      puts "WRONG!"
      return false
    end
end

def random_number
#Generates a random number between 1 and 20  
  return rand(20) + 1
end

def subtract_life(player_id)
#Subtracts a life from either player if they provide a wrong answer
  if player_id == 1
    @player_one[:lives] -= 1
  else
    @player_two[:lives] -= 1
  end
end

def add_point(player_id)
#Adds a point to either player if they provide a correct answer  
  if player_id == 1
    @player_one[:points] += 1
  else
    @player_two[:points] += 1
  end
end

initiate_game