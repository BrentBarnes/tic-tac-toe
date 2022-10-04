class UI
  attr_accessor :player1_name, :player2_name, :player_selection, :replay

  def initialize
    @player1_name = nil
    @player2_name = nil
    @player_selection = nil
    @replay = nil
  end

  def get_player_name
    puts "Player 1, please enter your name."
    @player1_name = gets.chomp
    puts "#{@player1_name}, your marker will be X."
    puts "Player 2, please enter your name."
    @player2_name = gets.chomp
    puts "#{@player2_name}, your marker will be O."
  end

  def get_player_selection(player_number)
    if player_number == 1
      puts "#{player1_name}, select an available space (1-9) to place your X."
      @player_selection = gets.chomp.to_i
    else
      puts "#{player2_name}, select an available space (1-9) to place your O."
      @player_selection = gets.chomp.to_i
    end
  end

  def get_replay_reply(winner_number)
    if winner_number == 'tie'
      puts "Would you like to play again? Type 'y' for yes and 'n' for no."
    elsif winner_number == 1
      puts "#{player1_name} wins! Would you like to play again? Type 'y' for yes and 'n' for no."
    else
      puts "#{player2_name} wins! Would you like to play again? Type 'y' for yes and 'n' for no."
    end
    
    @replay = gets.chomp

    if replay != 'y' && replay != 'n'
      puts "Please choose either 'y' or 'n'."
      @replay = gets.chomp      
    elsif replay == 'y'
      puts 'Alrighty, here we go!'
    elsif replay == 'n'
      puts "Bye bye then!"
    end
  end
end