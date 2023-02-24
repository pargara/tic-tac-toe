# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require 'pry'

class Game
  def initialize
    greetin_start
    create_board
    create_players
    @board.print_board
    play
  end

  def create_players
    @player1 = Player.new('X')
    @player2 = Player.new('O')
    @current_player = @player1
  end

  def create_board
    @board = Board.new
  end

  def play
    until @board.no_more_positions?
      @current_player.movement
      @board.update_table(@current_player.positions, @current_player.code)

      if @current_player.win?
        puts "#{@current_player.code} gano"
        break
      end

      switch_player
    end
    puts 'Empate' if @board.no_more_positions?
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def greetin_start
    puts "
                                      JUEGO TIC TAC TOE

                                      Tienes que poner tu signo en la tabla
                                      y completar ya sea 3 en diagonal,
                                      vertical, horozontal de forma seguida
                                      antes de que tu oponente lo haga
   "
  end
end

jugar = Game.new
