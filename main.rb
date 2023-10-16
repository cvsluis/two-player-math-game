require './game'

puts "Welcome to the 2 Player Math Game! 👾"
puts "Answer the addition question correctly or else lose one of 3 lives!"

puts "Player 1, what is your name?"
player_one = gets.chomp
player_one = player_one.strip == '' ? "Player 1" : player_one

puts "Player 2, what is your name?"
player_two = gets.chomp
player_two = player_two.strip == '' ? "Player 2" : player_two

puts "#{player_one} starts!"

game_one = Game.new()
game_one.play(player_one, player_two)