require_relative 'board.rb'
require_relative 'knight.rb'

playboard = Board.new
playboard.knights_moves([3,3],[4,3])

playboard.knights_moves([4,3],[3,3])

playboard.knights_moves([5,3],[1,2])



