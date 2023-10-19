require './game'

puts "Welcome to the 2 Player Math Game! 👾"
puts "Answer the addition question correctly or else lose one of 3 lives!"

puts "Player 1, what is your name?"
name1 = gets.chomp
player_one = name1.strip == '' ? "Player 1" : name1

puts "Player 2, what is your name?"
name2 = gets.chomp
player_two = name2.strip == '' ? "Player 2" : name2

puts "#{player_one} starts!"

game_one = Game.new
game_one.play(player_one, player_two)