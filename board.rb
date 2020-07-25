class Board
  
  attr_accessor :board, :knight

  SIZE = 8
  
  def initialize
    @board = build_board
  end
  
  def build_board
      # @coordinates = board.first.each_index.to_a.product(board.each_index.to_a)
    Array.new(SIZE) {Array.new(SIZE, " ")}
  end

  def bfs_traversal(src, trg, queue = [])
    queue << src
    until queue.empty?
      current = queue.shift
      return current if current.x == trg.x && current.y == trg.y
      current.where_can_jump_from.each { |child| queue << child }
    end
  end
  
  def knights_moves(from, to)
    src = Knight.new(*from)
    trg = Knight.new(*to)
    path = bfs_traversal(src, trg)
    p path
    p route(path)
    # route = []
    # route.unshift([trg.x, trg.y])
    # current = path.parent
    # until current.nil?
    #   route.unshift [current.x, current.y]
    #   current = current.parent
    # end
    # puts "You made it in #{route.length - 1} moves! Here's your path:"
    # # puts "#{route} : "
    # route.each { |move| puts "=> #{move}" }
    
    # p route
    # # puts route.each { |move| move }
    # return nil
  end

  def route(node, route = [])
    return route if node.parent.nil?
    route(node.parent, route)
    route << [node.x, node.y]
  end

  def place_knight(x, y)
    board[x][y] = "K"
  end

  def show
    puts "    0   1   2   3   4   5   6   7  "
    puts "  +---+---+---+---+---+---+---+---+"
    board.each_with_index do |inner, idx| 
      puts "#{idx} | " + inner.each { |cell| cell}.join(' | ') + " |"
      puts "  +---+---+---+---+---+---+---+---+"
    end
  end
end
