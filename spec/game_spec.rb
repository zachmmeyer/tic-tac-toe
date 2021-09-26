# frozen_string_literal: true

require '../lib/game'

describe Game do
  describe '#switch_player' do
    it 'switches the current player from Player 1 to Player 2' do
      @current_player = @player01
      Game.switch_player
      expect(@current_player).to eql(@player02)
    end
    it 'switches the current player from Player 2 to Player 1' do
      @current_player = @player02
      Game.switch_player
      expect(@current_player).to eql(@player01)
    end
  end
end
