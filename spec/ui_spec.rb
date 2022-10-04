# require 'game'
# require 'board'
require 'ui'
# require 'tic_tac_toe'
require 'spec_helper'

RSpec.describe UI do

  subject(:ui) { described_class.new }
  let(:ui_double) { instance_double(UI) }

  describe '#get_player_name' do
    context 'when asked for name' do
      let(:player1) { ui.instance_variable_get(:@player1_name) }
      let(:player2) { ui.instance_variable_get(:@player2_name) }

      it 'returns foo as first input and bar as second' do
        allow($stdin).to receive(:gets).and_return('foo', 'bar')
        player1 = $stdin.gets
        player2 = $stdin.gets
        expect(player1).to eq('foo')
        expect(player2).to eq('bar')
      end
    end
  end

  describe '#get_replay_reply' do
    context 'when prompted' do
      let(:replay) { ui.instance_variable_get(:@replay) }
      

      it 'gets player input' do
        allow($stdin).to receive(:gets).and_return('y')
        replay = $stdin.gets
        expect(replay).to eq('y')
      end
    end
  end

end