class Game

  def initialize
    print 'Player 1, Please enter your name: '
    @name = gets.chomp
    @p_1 = Player.new(@name)
    print 'Player 2, Please enter your name: '
    @name = gets.chomp
    @p_2 = Player.new(@name)
    @@round = 0
    self.play
  end

  def turn
    if (@@round %2 == 0)
      @p_turn = @p_1
    else 
      @p_turn = @p_2
    end
  end 

  def play
    while (@p_1.lives > 0 && @p_2.lives > 0)
      self.turn
      @@round += 1
      @new_q = Question.new
      puts "#{@p_turn.name}'s Turn"
      print "#{@p_turn.lives}/3 Lives: #{@new_q.question} = "
      @guess = gets.chomp
      if @new_q.check(@guess)
        puts "#{@p_turn.name} (#{@p_turn.lives}/3): Correct!"
      else
        @p_turn.reduce_lives
        puts "#{@p_turn.lives}/3 lives: False! The answer was #{@new_q.correct}"
      end
    end
    self.turn
    puts "Game Over!"
    puts "#{@p_turn.name} won with #{@p_turn.lives}/3 lives left" 
  end
end
