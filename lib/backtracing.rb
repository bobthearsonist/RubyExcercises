# all backtracing problems can only be solved by trying every possible configuration
# each configuration is tried only once

# Knights tour returns a solved bourd as a 2d array with a move number in each space
# https://en.wikipedia.org/wiki/Knight%27s_tour
class KnightsTour
  def initialize(board_size,start_position = Position.new)
    @board = Board.new(board_size)
    @piece = Knight.new(start_position)
  end

  # do not use for large boards

  def naive_tour(board); end

  # use backtracking algorithm to solve

  def backtracking_tour(start_position = @piece.position)
    @board.update(@piece)
    return @board if backtrack(@board,@piece)
    "solution does not exist" 
  end

  # recursive helper
  private

  def backtrack(board, piece)
    return true if board.solved

    # try all of the moves
    piece.class.moves.each_index do |possible_move|
       
      if (piece.move(possible_move, board)) 
        board.update(piece)
        return backtrack(board, piece) 
      else
        board.move_back(piece)
      end
    end
    false
  end
end

# moves for the night
class Knight
  @@moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]

  def self.moves
    @@moves
  end

  def initialize(position = Position.new)
    @move_counter = 0
    @position = position
  end

  attr_accessor :position
  attr_accessor :move_counter

  def move(move_selector, board)
    new_position = @position.dup
    new_position.move(@@moves[move_selector])
    return false unless board.valid_move(new_position)
    
    @position = new_position.dup
    @move_counter += 1
    return true
  end
end

# Handles the board
class Board
  def initialize(size)
    @size = size
    @board = {}
  end

  def move_back(position)
    @board.delete(position)
    p "move back" + self.to_s
  end

  def update(piece)
    @board[piece.position] ||= piece.move_counter
    p "move " + self.to_s
  end

  def solved
    @board.count.equal?(@size*@size)
  end

  def valid_move(new_position)
    new_position.x <= @size &&
      new_position.x >= 0 &&
      new_position.y <= @size &&
      new_position.y >= 0 &&
      @board[new_position].nil?
  end

  def to_s
    @board.map{|move| "\[#{move[0].x}\,#{move[0].y}\] #{move[1]}"}.join(', ')
  end
end

# A coordinate class
class Position
  def initialize(initial_x = 0, initial_y = 0)
    @x = initial_x
    @y = initial_y
  end

  attr_reader :x
  attr_reader :y

  def move(delta)
    @x += delta[0]
    @y += delta[1]
    self
  end

  # defined so that object id is not used in board hash
  def ==(other)
    other.x == @x and
      other.y == @y
  end

  alias eql? ==

  def hash
    @x.hash ^ @y.hash # XOR
  end
end
