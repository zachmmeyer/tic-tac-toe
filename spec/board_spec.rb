# frozen_string_literal: true

require '../lib/board'

describe Board do
  describe '#draw_board' do
    def black_text_blue_bg(input)
      "\e[30;46m #{input} \e[0m"
    end
    it 'draws a numbered tic-tac-toe board' do
      board = Board.new
      board_grid =
        <<~BOARD

          #{black_text_blue_bg(1)} #{black_text_blue_bg(2)} #{black_text_blue_bg(3)}

          #{black_text_blue_bg(4)} #{black_text_blue_bg(5)} #{black_text_blue_bg(6)}

          #{black_text_blue_bg(7)} #{black_text_blue_bg(8)} #{black_text_blue_bg(9)}

        BOARD
      expect(board.draw_board).to eql(board_grid)
    end
  end
end
