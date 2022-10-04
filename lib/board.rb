
class Board
  attr_accessor :cell_number, :game_status

  def initialize(cell_number = ['x', 1, 2, 3, 4, 5, 6, 7, 8, 9], game_status = nil)
    @cell_number = cell_number
    @game_status = game_status
  end

  def create_board
    new_row = "---+---+---"

    puts
    puts " #{cell_number[1]} | #{cell_number[2]} | #{cell_number[3]} "
    puts new_row
    puts " #{cell_number[4]} | #{cell_number[5]} | #{cell_number[6]} "
    puts new_row
    puts " #{cell_number[7]} | #{cell_number[8]} | #{cell_number[9]} "
  end

  def add_move(location, marker)
    cell_number[location] = marker
  end

  def check_game_status(marker)
    if cell_number[1] == marker && cell_number[2] == marker && cell_number[3] == marker ||
       cell_number[4] == marker && cell_number[5] == marker && cell_number[6] == marker ||
       cell_number[7] == marker && cell_number[8] == marker && cell_number[9] == marker ||
       cell_number[1] == marker && cell_number[4] == marker && cell_number[7] == marker ||
       cell_number[2] == marker && cell_number[5] == marker && cell_number[8] == marker ||
       cell_number[3] == marker && cell_number[6] == marker && cell_number[9] == marker ||
       cell_number[1] == marker && cell_number[5] == marker && cell_number[9] == marker ||
       cell_number[3] == marker && cell_number[5] == marker && cell_number[7] == marker
      puts "GAME OVER!"
      if marker == 'X'
        @game_status = 'player1 wins'
      else
        @game_status = 'player2 wins'
      end
    elsif (cell_number & [1, 2, 3, 4, 5, 6, 7, 8, 9]).any? == false
      puts "GAME OVER! It's a tie!"
      @game_status = 'tie'
    end
  end
end