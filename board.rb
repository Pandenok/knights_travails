class Board
  
  attr_accessor :board, :knight

  SIZE = 8
  
  def initialize
    @board = build_board
  end
  
  def build_board
    Array.new(SIZE) {Array.new(SIZE, " ")}
  end

  def bfs_traversal(src, trg, queue = [])
    queue << src
    until queue.empty?
      current = queue.shift
      return current if current.x == trg.x && current.y == trg.y
      current.where_can_jump.each { |child| queue << child }
    end
  end
  
  def knight_moves(from, to)
    src = Knight.new(*from)
    trg = Knight.new(*to)
    traversal = bfs_traversal(src, trg)
    route = route(traversal)
    route.each { |move| place_knight(*move) }
    puts "\nYou made it in #{route.length - 1} moves! Here's your path:"
    route.each { |move| puts " => #{move}" }
  end

  def route(node, route = [])
    if node.parent.nil?
      route << [node.x, node.y]
      return route 
    end
    route(node.parent, route)
    route << [node.x, node.y]
  end

  def place_knight(x, y)
    board[x][y] = "K"
  end

  def show
    puts "\n    0   1   2   3   4   5   6   7  "
    puts "  +---+---+---+---+---+---+---+---+"
    board.each_with_index do |inner, idx| 
      puts "#{idx} | " + inner.each { |cell| cell}.join(' | ') + " |"
      puts "  +---+---+---+---+---+---+---+---+"
    end
  end
end
