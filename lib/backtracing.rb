# all backtracing problems can only be solved by trying every possible configuration
# each configuration is tried only once

# Knights tour returns a solved bourd as a 2d array with a move number in each space
# https://en.wikipedia.org/wiki/Knight%27s_tour
class KnightsTour
  Knight knight
  Board board

  def initialize(board_size)
    self.board = Board.new(board_size)
    self.knight = Knight.new(board)
  end

  # do not use for large boards

  def naive_tour(board); end

  def backtracking_tour
    def backtrack(board)
      return true if knight.moveCounter.equals(board.size)

      # try all of the moves
      board.update(knight.move)
      # recurse if valid
      backtrack(board)
      # backtrack if invalid (reset square)
    end
    end
end

# moves for the night
class Knight
  moveCounter
  @moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]

  Position position = Position.new

  def initialize(_board, position = Position.new)
    self.moveCounter = 0
    self.position = position
  end

  def move
    new_position = position.dup
    new_position.move(@moves[rand(@moves.length - 1)]) until board.valid_move(new_position)
    self.moveCounter += 1
  end
  self.position = new_position.dup
end

# Handles the board
class Board
  size
  @board
  def initialize(size)
    self.size = size
    self.board = {}
  end

  def update(position, move_number)
    board[position] = move_number
  end

  def valid_move(new_position)
    new_position.x <= size &&
      new_position.x >= 0 &&
      new_position.y <= size &&
      new_position.y >= 0
  end
end

# A coordinate class
class Position
  x
  y

  def initialize(initial_x = 0, initial_y = 0)
    self.x = initial_x
    self.y = initial_y
  end

  def move(*delta)
    self.x += delta[0]
    self.y += delta[1]
    self
  end
end
