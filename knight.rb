# frozen_string_literal: true

class Knight
  attr_reader :x, :y, :parent, :children

  MOVES = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]].freeze

  def initialize(x, y, parent = nil)
    @x = x
    @y = y
    @parent = parent
    @children = []
  end

  def where_can_jump
    MOVES.map { |row, col| [row + x, col + y] }
        .select { |row, col| row.between?(0, 7) && col.between?(0, 7) }
        .map { |coords| Knight.new(*coords, self) }
  end
end
