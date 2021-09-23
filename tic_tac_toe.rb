# frozen_string_literal: true

# Contains Tic Tac Toe Board
class Board
  def initialize
    @board = Array.new(9) { |i| i + 1 }
  end

  def draw_board
    <<~BOARD
      #{@board[0]}|#{@board[1]}|#{@board[2]}
      #{@board[3]}|#{@board[4]}|#{@board[5]}
      #{@board[6]}|#{@board[7]}|#{@board[8]}
    BOARD
  end
end

# Contains Player
class Player
  attr_reader :mark, :name

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

# Contains Game
class Game
  @board = Board.new
  @game_name = 'Tic-Tac-Toe'
  @player01 = Player.new('Player 1', 'X')
  @player02 = Player.new('Player 2', 'O')
  @current_player = @player01
    system('clear')
    puts @game_name
    puts @board.draw_board
  end
end

Game.start
