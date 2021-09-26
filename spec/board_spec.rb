# frozen_string_literal: true

require '../lib/board'

describe Board do
  describe '#draw_board' do
    it 'draws a numbered tic-tac-toe board' do
      board = Board.new
      board_grid =
        <<~BOARD
          1|2|3
          4|5|6
          7|8|9
        BOARD
      expect(board.draw_board).to eql(board_grid)
    end
  end
end
