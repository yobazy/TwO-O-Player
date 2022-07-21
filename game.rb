class Game
  attr_accessor :current_player, :players

  def initialize(p1, p2)
    @players = [p1, p2]
    @current_player = @players[0]
  end

  def start_game
    player1 = @players[0]
    player2 = @players[1]


    puts "P1: #{@players[0].name} vs P2: #{@players[1].name}"
    puts current_player.name

    while player1.score > 0 && player2.score > 0
      question = Question.new
      question.question_generator
      input = gets.chomp.to_i
      if input != question.sum
        self.wrong_answer
      else
        puts "Correct!"
      end

      self.end_turn
    end
    self.score
  end

  def change_player
    if @current_player == @players[0]
      @current_player = @players[1]
      puts @current_player.name
    else
      @current_player = @players[0]
      puts @current_player.name
    end
  end

  def wrong_answer
    puts "Wrong...!"
    @current_player.loses_life
  end

  def score
    puts "#{@players[0].name} : #{@players[0].score}/3 vs #{@players[1].name} : #{@players[1].score}/3"

    if @players[0].score == 0 || @players[1].score == 0
      puts "Game over!"
    end
  end

  def end_turn
    puts "New turn"
    current_player
    change_player
  end
end