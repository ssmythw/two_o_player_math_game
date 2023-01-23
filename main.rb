require './Player.rb'
require './Manager.rb'

    player1 = Player.new("Player 1")
    player2 = Player.new("Player 2")
    game = Manager.new(player1, player2)
    game.start