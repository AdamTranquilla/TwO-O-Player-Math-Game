class Question
  attr_accessor :num_1, :num_2, :question, :correct

  def initialize
    @num_1 = rand(1..20)
    @num_2 = rand(1..20)
    @question = "#{@num_1} + #{@num_2}"
    @correct = @num_1 + @num_2
  end

  def check(guess)
    guess.to_i == @correct
  end
end