require './player'
require './question'

class Game 
  def initialize()
    @play = true
    @first_player = true
  end

  def switch_player
    @first_player = !@first_player
  end

  def ask_question(player)
    puts "\n----- NEW TURN -----"
    question = Question.new()
    puts "#{player.name}: " + question.string
    player_answer = gets.chomp

    if question.answer.to_s == player_answer
      puts "✅ Correct! Answer is: #{question.answer}"
    else
      puts "❌ Incorrect! Answer is: #{question.answer}"
      player.deduct_life
    end
    switch_player

  end

  def play(name1, name2)
    player_one = Player.new(name1)
    player_two = Player.new(name2)

    while (@play) do
      current_player = @first_player ? player_one : player_two
      ask_question(current_player)
      puts "👾 #{player_one.name}: #{player_one.lives}/3 vs #{player_two.name}: #{player_two.lives}/3"
    
      if player_one.dead? || player_two.dead?
        puts (player_one.dead? && "🏆🎉 #{player_two.name} wins with a score of #{player_two.lives}/3") || (player_two.dead? && "🏆🎉 #{player_one.name} wins with a score of #{player_one.lives}/3")
        puts "----- GAME OVER -----"
        puts "Good bye! 👋"
        @play = false
      end

    end

  end

end