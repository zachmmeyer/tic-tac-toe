# frozen_string_literal: true

# Board class that generates and draws the game board
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9) { |i| "\e[30;46m #{i + 1} \e[0m" }
  end

  def draw_board
    <<~BOARD

      #{@board[0]} #{@board[1]} #{@board[2]}

      #{@board[3]} #{@board[4]} #{@board[5]}

      #{@board[6]} #{@board[7]} #{@board[8]}

    BOARD
  end
end
