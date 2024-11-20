require_relative "lib/game"

game = Game.new

game.board.make_play("X", 1, 1)
game.board.make_play("O", 1, 0)
game.board.make_play("X", 1, 2)
puts game.board.inspect


game.show_board