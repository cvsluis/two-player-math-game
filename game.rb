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
    question = Question.new
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

  def game_over(winner)
    puts "🏆🎉 #{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye! 👋"
    @play = false
  end

  def play(name1, name2)
    player_one = Player.new(name1)
    player_two = Player.new(name2)

    while (@play) do
      current_player = @first_player ? player_one : player_two
      ask_question(current_player)
      puts "👾 #{player_one.name}: #{player_one.lives}/3 vs #{player_two.name}: #{player_two.lives}/3"
    
      if player_one.dead?
        game_over(player_two)
      elsif player_two.dead?
        game_over(player_one)
      end

    end

  end

end