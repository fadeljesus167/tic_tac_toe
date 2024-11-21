class Board
  attr_reader :board_array

  def initialize
    @board_array = Array.new(3) {Array.new(3, ' ')}
  end

  def make_play(player, row, col)
    if is_blank?(board_array[row][col])
      board_array[row][col] = player
      return true
    else
      return false
    end
  end

  def calculate_moves
    arr = []
    board_array.map do |row|
      row_str = row.join.strip
      
      arr << row_str
    end

    board_array.transpose.map do |row|
      row_str = row.join.strip

      arr << row_str
    end
    # add the diagonals
    arr << [board_array[0][0], board_array[1][1], board_array[2][2]].join
    arr << [board_array[0][2], board_array[1][1], board_array[2][0]].join

    return arr
  end

  def check_victory
    calculated_moves = calculate_moves
    puts calculated_moves.inspect
    victory = nil

    calculated_moves.each do |row|
      if row.eql?("XXX") 
        victory = "X"
        break
      elsif row.eql?("OOO")
        victory = "O"
        break
      else
          victory = nil
      end
    end

    return victory
  end

  def is_blank?(value)
    value.eql?(' ')
  end
end