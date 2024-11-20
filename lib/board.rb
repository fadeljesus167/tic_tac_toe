class Board
  attr_reader :board_array

  def initialize
    @board_array = Array.new(3) {Array.new(3, ' ')}
  end

  def make_play(player, row, col)
    board_array[row][col] = player
  end

  def check_rows

  end

  def check_victory
    return nil
  end
end