require_relative "board"

class Game
  attr_reader :board

  def initialize
    @board = Board.new
    @turn = "X"
  end

  def show_board
    puts '-'*13
    board.board_array.each do |row|
      puts "| #{row[0]} | #{row[1]} | #{row[2]} |"
      puts '-'*13
    end
  end

  def loop
    while !has_finish?
      move = new_move

      if board.make_play(current_player_turn, move[0], move[1])
        system 'clear'
        show_board
      else
        puts "Invalid move"
        puts "Repeat your move " + current_player_turn + " wait"
      end
    end
  end

  def new_move
    puts "Write your move (Ex. 0 1): "
    move = gets.chomp.split(' ').map(&:to_i)

    return move
  end

  def has_finish?
    victory = board.check_victory

    if victory.nil?
      return false
    else
      puts "#{victory} has won!"
      return true
    end
  end

  def current_player_turn
    if @turn.eql?("X")
      @turn = "O"
      return "X"
    else
      @turn = "X"
      return "O"
    end
  end
end