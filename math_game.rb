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
end

def game_over?(p1, p2)
 #Checks if either player has zero lives to decide if game is over. 
end

def check_answer(answer, num1, num2, current_player_id)
#Checks if the answer to the addidion is correct or wrong and notifies the player
end

def random_number
#Generates a random number between 1 and 20  
end

def subtract_life(player_id)
#Subtracts a life from either player if they provide a wrong answer
end

def add_point(player_id)
#Adds a point to either player if they provide a correct answer  
end

initiate_game