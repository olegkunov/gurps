
class Dice

  attr_reader :random
  private :random

  def initialize(mult, add)
    @mult = mult
    @add = add
    @random = Random.new
  end

  def throw
    (random.rand * 6).ceil * @mult + @add
  end

end