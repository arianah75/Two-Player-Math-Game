require_relative 'player'
require_relative 'question'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def start_game
    until @player1.lives == 0 || @player2.lives == 0
      question = Question.new
      puts "#{@current_player.name}: #{question.question_string}"
      print "> "
      answer = gets.chomp.to_i
      if question.correct_answer?(answer)
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        @current_player.lose_life
      end
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      puts "----- NEW TURN -----"
      switch_turns
    end
    puts "#{(@player1.lives == 0) ? @player2.name : @player1.name} wins with a score of #{(@player1.lives == 0) ? @player2.lives : @player1.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end
