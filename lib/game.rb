# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# Game class that runs the game logic and hosts variables
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

  def self.message
    @game_active ? "Active player: #{@current_player.name}" : "#{current_player} won!"
  end

  def self.update_board
    system('clear')
    puts @game_name
    puts message
    puts @board.draw_board
  end

  def self.next_turn
    update_board
    prompt_player if @game_active
  end

  def self.start
    Game.next_turn while @game_active
  end
end
