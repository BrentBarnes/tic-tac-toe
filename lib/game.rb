class Game
  attr_accessor :ui_handler, :board_handler, :player1_turn

  def initialize
    @ui_handler = UI.new
    @board_handler = Board.new
    @player1_turn = true
  end

  def ask_for_player_names
    ui_handler.get_player_name
  end

  def ask_for_player_selection
    if player1_turn
      ui_handler.get_player_selection(1)
    else
      ui_handler.get_player_selection(2)
    end
  end

  def display_board
    puts board_handler.create_board
  end

  def player_move
    location = ui_handler.player_selection
    if player1_turn
      board_handler.add_move(location, "X")
    else
      board_handler.add_move(location, "O")
    end
  end

  def get_game_status
    if player1_turn
      board_handler.check_game_status('X')
    else
      board_handler.check_game_status('O')
    end
  end

  def end_turn
    if board_handler.game_status != nil

    elsif player1_turn
      @player1_turn = false
    else
      @player1_turn = true
    end
  end

  def ask_for_replay
    if board_handler.game_status == 'tie'
      ui_handler.get_replay_reply('tie')
    elsif board_handler.game_status == 'player1 wins'
      ui_handler.get_replay_reply(1)
    else
      ui_handler.get_replay_reply(2)
    end
    board_handler.game_status = nil
    board_handler.cell_number = ['x', 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end