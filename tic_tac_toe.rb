# frozen_string_literal: true

# Contains Tic Tac Toe Board
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9) { |i| (i + 1).to_s }
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
  attr_accessor :choice

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
  @game_active = true
  @prompt_good = false
  @prompt_failed = false

  def self.switch_player
    @current_player = if @current_player == @player01
                        @player02
                      else
                        @player01
                      end
  end

  def self.prompt_succeed
    @prompt_good = false
    @prompt_failed = false
    switch_player
    next_turn
  end

  def self.prompt_failure
    @prompt_failed = true
    update_board
  end

  def self.prompt_player
    until @prompt_good
      puts "Please pick a remaining number\n" if @prompt_failed
      @current_player.choice = gets.chomp
      @board.board.include?(@current_player.choice) ? @prompt_good = true : prompt_failure
    end
    prompt_succeed
  end

  def self.game_message
    if @game_active
      prompt_player
    else
      puts "#{current_player} won!"
    end
  end

  def self.update_board
    system('clear')
    puts @game_name
    puts "Active player: #{@current_player.name}"
    puts @board.draw_board
  end

  def self.next_turn
    update_board
    puts game_message
  end

  def self.start
    Game.next_turn while @game_active
  end
end

Game.start
