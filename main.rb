require_relative 'board.rb'
require_relative 'knight.rb'

def demo
  playboard = Board.new
  playboard.show

  print "\nEnter the x coordinates for starting position (0 to 7): "
  x_from = gets.chomp.to_i
  print 'Enter the y coordinates for starting position (0 to 7): '
  y_from = gets.chomp.to_i
  print 'Enter the x coordinates for ending position (0 to 7): '
  x_to = gets.chomp.to_i
  print 'Enter the y coordinates for ending position (0 to 7): '
  y_to = gets.chomp.to_i

  from = [x_from, y_from]
  to = [x_to, y_to]

  playboard.knight_moves(from, to)
  playboard.show
end

demo
# playboard = Board.new
# playboard.knight_moves([0,0],[7,5])
# playboard.show



