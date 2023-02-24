# frozen_string_literal: true

class Player
  attr_reader :positions, :code

  WAYS_TO_WIN = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]].freeze
  def initialize(code)
    @code = code
    @positions = []
  end

  def movement
    puts "Es el turno de #{code} "
    @number = gets.chomp
    @positions << @number
  end

  def win?
    WAYS_TO_WIN.any? { |win| (win - @positions.map(&:to_i)).empty? }
  end
end
