module GameActions
  # attr_accessor :player1_name, :player2_name

  # @player1_turn = true
  # @game_done = false
  # @play_again = 'y'

  # def self.get
  #   @player1_turn = false
  # end
  
  # def self.get_second
  #   @player1_turn
  # end

  def player_selection
    cell_chosen = gets.chomp.to_i
    p "Player selection Player1 turn is: #{@player1_turn}"
    puts @player1_turn
    p @cell_number

    cell_number.map do |cell|
      if cell == cell_chosen && @player1_turn
        @cell_number[cell_chosen] = 'X'
        @player1_turn = false
        return
      elsif cell == cell_chosen && !@player1_turn
        @cell_number[cell_chosen] = 'O'
        @player1_turn = true
        return
      end
    end
  end

  def check_for_game_over
    if cell_number[1] == 'X' && cell_number[2] == 'X' && cell_number[3] == 'X' ||
       cell_number[4] == 'X' && cell_number[5] == 'X' && cell_number[6] == 'X' ||
       cell_number[7] == 'X' && cell_number[8] == 'X' && cell_number[9] == 'X' ||
       cell_number[1] == 'X' && cell_number[4] == 'X' && cell_number[7] == 'X' ||
       cell_number[2] == 'X' && cell_number[5] == 'X' && cell_number[8] == 'X' ||
       cell_number[3] == 'X' && cell_number[6] == 'X' && cell_number[9] == 'X' ||
       cell_number[1] == 'X' && cell_number[5] == 'X' && cell_number[9] == 'X' ||
       cell_number[3] == 'X' && cell_number[5] == 'X' && cell_number[7] == 'X'
      @game_done = true
      puts "GAME OVER! #{player1_name} is the winner!"
    elsif cell_number[1] == 'O' && cell_number[2] == 'O' && cell_number[3] == 'O' ||
          cell_number[4] == 'O' && cell_number[5] == 'O' && cell_number[6] == 'O' ||
          cell_number[7] == 'O' && cell_number[8] == 'O' && cell_number[9] == 'O' ||
          cell_number[1] == 'O' && cell_number[4] == 'O' && cell_number[7] == 'O' ||
          cell_number[2] == 'O' && cell_number[5] == 'O' && cell_number[8] == 'O' ||
          cell_number[3] == 'O' && cell_number[6] == 'O' && cell_number[9] == 'O' ||
          cell_number[1] == 'O' && cell_number[5] == 'O' && cell_number[9] == 'O' ||
          cell_number[3] == 'O' && cell_number[5] == 'O' && cell_number[7] == 'O'
      @game_done = true
      puts "GAME OVER! #{player2_name} is the winner!"
    elsif (cell_number & [1, 2, 3, 4, 5, 6, 7, 8, 9]).any? == false
      puts 'GAME OVER! It was a tie!'
      @game_done = true
    end
  end
end

class Text
  include GameActions

  attr_accessor :player1_name, :player2_name, :player1_turn, :game_done, :play_again


  def initialize
    @player1_name
    @player2_name
    @player1_turn = true
    @game_done = false
    @play_again = 'y'
  end

  def intro_sequence
    puts 'What is the name of player #1?'
    @player1_name = gets.chomp
    puts "#{player1_name}, your marker is X"
    puts
    puts 'What is the name of player #2?'
    @player2_name = gets.chomp
    puts "#{player2_name}, your marker is O"
    puts
  end

  def new_turn
    p "New Turn Player1 turn is: #{player1_turn}"
    if player1_turn
      puts "#{player1_name}, please enter a number (1-9) that is available to place an 'X'."
    else
      puts "#{player2_name}, please enter a number (1-9) that is available to place an 'O'."
    end
  end

  def replay
    puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
    @play_again = gets.chomp

    if @play_again == 'y'
      puts 'Alrighty, here we go!'
      game_done = false
      player1_turn = true
    elsif @play_again == 'n'
      puts 'Bye bye then!'
      game_done = false
    elsif @play_again != 'y' || @play_again != 'n'
      puts 'Please enter valid response.'
    end
  end
end

class Layout < Text
  include GameActions

  attr_accessor :cell_number, :new_row

  def initialize
    @cell_number = ['x', 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @new_row = '---+---+---'
  end

  def create_layout
    puts
    puts " #{cell_number[1]} | #{cell_number[2]} | #{cell_number[3]} "
    puts new_row
    puts " #{cell_number[4]} | #{cell_number[5]} | #{cell_number[6]} "
    puts new_row
    puts " #{cell_number[7]} | #{cell_number[8]} | #{cell_number[9]} "
    puts
  end

end

class Game < Text
  include GameActions

  def run_game
    until play_again == 'n'
      layout = Layout.new
      text = Text.new
      game = Game.new

      text.intro_sequence
        until game_done == true
          text.new_turn
          layout.create_layout
          game.player_selection
          layout.check_for_game_over
        end
      layout.create_layout
      text.replay
      until play_again == 'y' || play_again == 'n'
        text.replay
      end
    end
  end

  def self.class_method
    p self
  end

  def instance_method
    p self
  end
end

game = Game.new
game.run_game

# p GameActions.get
# p GameActions.get_second