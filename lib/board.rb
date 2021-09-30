# frozen_string_literal: true

# Board class that generates and draws the game board
class Board
  attr_accessor :board

  def color_board(input1, input2, input3)
    "\e[30;46m #{input1} \e[0m \e[30;46m #{input2} \e[0m \e[30;46m #{input3} \e[0m"
  end

  def initialize
    @board = Array.new(9) { |i| i + 1 }
  end

  def draw_board
    <<~BOARD

      #{color_board(@board[0], @board[1], @board[2])}

      #{color_board(@board[3], @board[4], @board[5])}

      #{color_board(@board[6], @board[7], @board[8])}

    BOARD
  end
end
