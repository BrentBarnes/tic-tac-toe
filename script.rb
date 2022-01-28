class Game
  attr_accessor :player_input_handler, :display_handler

  def initialize
    @player_input_handler = PlayerInput.new
    @display_handler = Display.new
  end

  def ask_for_player_names
    player_input_handler.get_player_name
  end

  def return_player_names(player_number)
    if player_number == 1
      player_input_handler. player1_name
    end
  end

  def ask_for_player_selection
    return_player_names(1)
    player_input_handler.prompt_for_player_selection(1)
  end
end

class PlayerInput
  attr_accessor :player1_name, :player2_name, :player_selection

  def initialize
    @player1_name = nil
    @player2_name = nil
    @player_selection = nil
  end

  def get_player_name
    puts "Player 1, please enter your name."
    @player1_name = gets.chomp
    puts "#{@player1_name}, your marker will be X."
    puts "Player 2, please enter your name."
    @player2_name = gets.chomp
    puts "#{@player2_name}, your marker will be O."
  end

  def get_player_selection
    @player_selection = gets.chomp
  end
end

class Display
  attr_accessor :Game
  def initialize

  end

  def prompt_for_player_selection(player_number)
    if player_number == 1
      puts "#{player1_name}, select an available space (1-9) to place your X."
    else
      puts "#{player2_name}, select an available space (1-9) to place your O."
    end
  end
end

game = Game.new
game.ask_for_player_names
game.ask_for_player_selection