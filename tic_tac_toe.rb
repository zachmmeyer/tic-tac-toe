# frozen_string_literal: true

# Contains Tic Tac Toe Board
class Board
  def initialize
    @board = Array.new(9) { |i| i + 1 }
  end

  def draw_board
    puts "#{@board[0]}|#{@board[1]}|#{@board[2]}\n" \
         "#{@board[3]}|#{@board[4]}|#{@board[5]}\n" \
         "#{@board[6]}|#{@board[7]}|#{@board[8]}\n"
  end
end
