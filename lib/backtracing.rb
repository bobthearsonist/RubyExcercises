# all backtracing problems can only be solved by trying every possible configuration
# each configuration is tried only once

# Knights tour returns a solved bourd as a 2d array with a move number in each space
# https://en.wikipedia.org/wiki/Knight%27s_tour
class KnightsTour
  def initialize(board_size)
    @board = Board.new(board_size)
    @knight = Knight.new
  end

  # do not use for large boards

  def naive_tour(board); end

  # use backtracking algorithm tosolve

  def backtracking_tour
    until backtrack
    end
    @board
  end

  # recursive helper
  private 
  def backtrack
    return true if @board.solved

    # try all of the moves
    Knight.moves.each_index do |possible_move|
      move_counter = @knight.move(possible_move, @board)
      if @board.update(@knight.position, move_counter)
        backtrack
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
    if board.valid_move(new_position)
      @position = new_position.dup
      @move_counter += 1
    end
    @move_counter
  end
end

# Handles the board
class Board
  def initialize(size)
    @size = size
    @board = {}
  end

  def update(position, move_number)
    if @board[position].nil?
      @board[position] = move_number
      true
    end
    false
  end

  def solved
    @board.count.equal?(@size)
  end

  def valid_move(new_position)
    new_position.x <= @size &&
      new_position.x >= 0 &&
      new_position.y <= @size &&
      new_position.y >= 0 &&
      @board[new_position].nil?
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
end
