# frozen_string_literal: true

class Board
  def initialize
    @table = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  ROW_SEP = '|'
  COL_SEP = '--+---+--'

  def print_board
    prueba = @table.map do |position|
      "#{position[0]} #{ROW_SEP} #{position[1]} #{ROW_SEP} #{position[2]} \n #{COL_SEP} "
    end
    puts prueba
  end

  def update_table(player_positions, player_code)
    @player_data = player_positions
    @player_code = player_code

    @table.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        @table[row_index][cell_index] = @player_code if @player_data.include?(cell.to_s)
      end
    end
    print_board
  end

  def no_more_positions?
    @table.flatten.none? { |p| p.is_a? Integer }
  end
end
