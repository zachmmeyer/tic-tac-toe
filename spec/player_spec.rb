# frozen_string_literal: true

require '../lib/player'

describe Player do
  player1 = Player.new('Player 1', 'X')
  describe '#name' do
    it 'returns players name' do
      expect(player1.name).to eql('Player 1')
    end
  end
  describe '#mark' do
    it 'returns players name' do
      expect(player1.mark).to eql('X')
    end
  end
end
