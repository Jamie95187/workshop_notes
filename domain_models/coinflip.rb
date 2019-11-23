class HeadCount
  def initialize
    @head_counter = 0
    @best_score = 0
    @coin = Coin.new
  end
  def flip_coin
    if @coin.flip == "heads"
      @head_counter += 1
    else
      @head_counter = 0
      best_score?
      @best_score = @head_counter
    end
  end

  def best_score?
    @head_counter > @best_score
  end

end

class Coin

  def initialize
    @random_number = Randomizer.new.random_number
  end

  def flip
    if @random_number == 0
      "heads"
    else
      "tails"
    end
  end

end

class Randomizer

  def random_number
    rand(2)
  end

end
