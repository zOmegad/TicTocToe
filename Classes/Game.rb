class Game
  
    #TO DO : créé 2 joueurs, créé un board


      def initialize
      	    puts "Le Joueur 1 va jouer les X, quel est ton nom ?"
            @player1 = Player.new(@player_name, "x")
            puts "le Joueur 2 va jouer les O, quel est ton nom ?"
            @player2 = Player.new(@player_name, "o")
            puts "#{@player1.player_name} -> X"
            puts "#{@player2.player_name} -> O"
            
            @board_game = Board.new
            @current_player = @player1
            @player1.player_team = "X"
            @player2.player_team = "O"
            @victory == false
            @player1.player_points = 0
            @player2.player_points = 0
     end
    
    
 

        def go
    # TO DO : lance la partie
      puts "Let's go!"
      puts "C'est le tour de #{@current_player.player_name}!" 

    #Le count va servir à compter le nombre de tours, au bout de 9 tours, il y a match nul
      count = 0

            
		      	while @board_game.victory? != true do
			        #tant qu'il n'y a pas de victoire, lance la methode turn puis rajoute un tour
			          turn
			          count +=1
			          

              #Si il y a victoire, determine le gagnant avec current player et affiche un texte 
			    if @board_game.victory? == true
			    	@board_game.show
			    	@current_player == @player1 ? @current_player = @player2 : @current_player = @player1
			    	winner = @current_player
			    	winner.player_points =+ 1
			    	
			    
			        puts "Winner! Good game, #{winner.player_name} !"


				elsif count == 9 
					puts "Match nul"	
          #Affiche match nul au bout de 9 tours				
				end
				end
		       
		      
  			
		end

  def turn
    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
 	
	   
 	  @board_game.show	
 	  team = @current_player.player_team
 	    current_player = @current_player
 	      puts "C'est le tour de #{@current_player.player_name} !"
        print "> "
 	        choice = gets.chomp.to_i

 	
 	if choice.between?(1, 9)
    #si le chiffre est entre 1 et 9 lance les méthodes
 		@board_game.play(choice, team, current_player)
 	else
    #sinon redemande le chiffre
 		puts "Choisis un chiffre entre 1 et 9"
 		choice = gets.chomp.to_i
 	end


  #Défini le joueur actuel, 
 	@current_player == @player1 ? @current_player = @player2 : @current_player = @player1
 	team = @current_player.player_team
	

 	

  end

  

end
