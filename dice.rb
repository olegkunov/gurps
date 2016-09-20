
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

  def to_s
    adder =
        case
          when @add < 0
            "#{@add}"
          when @add == 0
            ""
          else
            "+#{@add}"
        end
    "#{@mult}d#{adder}"
  end

end