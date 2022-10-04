# require 'game'
require 'pry-byebug'
require 'board'
# require 'ui'
# require 'tic_tac_toe'
require 'spec_helper'

RSpec.describe Board do

  describe '#add_move' do
    context 'when a move is added' do
      subject(:board) { described_class.new }      

      it 'updates the cell_number instance array' do
        cell_number = board.instance_variable_get(:@cell_number)
        board.add_move(3, 'X')
        expect(cell_number[3]).to eq('X')
      end
    end
  end

  describe '#check_game_status' do

    context 'when the top, horizontal row is all X' do
      let(:board) { described_class.new(['x','X','X','X',4,5,6,7,8,9])}
      it 'changes game status to player1 wins' do 
        board.check_game_status('X')
        expect(board.game_status).to eq('player1 wins')
      end
    end

    context 'when the middle, verticle row is all O' do
      let(:board) { described_class.new(['x',1,'O',3,4,'O',6,7,'O',9])}
      it 'changes game status to player2 wins' do
        board.check_game_status('O')
        expect(board.game_status).to eq('player2 wins')
      end
    end

    context 'when a diagonal row is all X' do
      let(:board) { described_class.new(['x','X',2,3,4,'X',6,7,8,'X'])}
      it 'changes game status to player1 wins' do
        board.check_game_status('X')
        expect(board.game_status).to eq('player1 wins')
      end
    end

    context 'when all spaces are filled without a winner' do
      let(:board) { described_class.new(['x','X','O','X','X','O','O','O','X','O'])}
      it 'changes game status to tie' do
        board.check_game_status('X')
        expect(board.game_status).to eq('tie')
      end
    end

  end

end