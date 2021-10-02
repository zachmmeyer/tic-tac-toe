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
  @turn_count = 0
  @winning_lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def self.check_for_tie
    return unless @turn_count == 9

    @winner_player = 'Neither player'
    @game_active = false
  end

  def self.check_for_winner
    @winning_lines.each do |line|
      if @board.board[line[0]] == @board.board[line[1]] && @board.board[line[0]] == @board.board[line[2]]
        @winner_player = @current_player.name
        @game_active = false
      end
    end
  end

  def self.switch_player
    @current_player = if @current_player == @player01
                        @player02
                      else
                        @player01
                      end
  end

  def self.mark_space
    @board.board.each_with_index do |number, index|
      @board.board[index] = @current_player.mark if @current_player.choice == number
    end
  end

  def self.prompt_succeed
    @prompt_good = false
    @prompt_failed = false
    mark_space
    check_for_winner
    @turn_count += 1
    check_for_tie
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
    @game_active ? "Active player: #{@current_player.name}" : "#{@winner_player} won!"
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
