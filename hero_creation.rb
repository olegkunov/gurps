
class HeroCreation

  attr_reader :points

  def initialize(template)
    @template = template
    @points = powerlevel
  end

  def powerlevel
    @template[:powerlevel]
  end

  def basic_lift
    @template[:st] ** 2 / 5
  end

  def calculate_points
    dev = []
    dev << (@template[:st] - 10) << (@template[:ht] - 10) \
        << (@template[:dx] - 10) << (@template[:iq] - 10)
    # p dev
    @points = powerlevel - (dev[0]+dev[1])*10 - (dev[2]+dev[3])*20
  end

  def basic_attributes
    {
        st: @template[:st],
        dx: @template[:dx],
        iq: @template[:iq],
        ht: @template[:ht]
    }
  end

  def basic_attr_change(attr, levels)
    @template[attr] += levels
    calculate_points
  end

end
