
require_relative 'board.rb'
require_relative 'game.rb'
require_relative 'ui.rb'

class TicTacToe
  def run_tic_tac_toe
  game = Game.new
    until game.ui_handler.replay == 'n' do
      game.ask_for_player_names
      
      while game.board_handler.game_status == nil do
        game.display_board
        game.ask_for_player_selection
        game.player_move
        game.get_game_status
        game.end_turn
      end
      game.ask_for_replay
    end
  end
end

ttt = TicTacToe.new
ttt.run_tic_tac_toe
