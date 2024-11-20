require_relative "board"
require_relative "player"

class Game
  attr_reader :board, :playerA, :playerB

  def initialize
    @board = Board.new
    @playerA = Player.new("X")
    @playerB = Player.new("O")
    @turn = @playerA
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

      board.make_play(current_player_turn, move[0], move[1])
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
      return true
    else
      return false
    end
  end

  def current_player_turn
    turn = @turn
    
    if @turn.eql?("X")
      @turn = "O"
    else
      @turn = "X"
    end

    return turn
  end
end