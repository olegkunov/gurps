
class HeroCreation

  attr_reader :points

  def initialize(template)
    @template = template
    @tunings = {st: 0, dx: 0, iq: 0, ht: 0, hp: 0, wl: 0, per: 0}
    @points = powerlevel
  end

  def powerlevel
    @template[:powerlevel]
  end

  def calculate_stat(attr)
    basic_stats = [:st, :dx, :ht, :iq]
    return @template[attr] + @tunings[attr] if basic_stats.include? attr
    case attr
      when :bl
        basic_st = calculate_stat(:st)
        (basic_st * basic_st / 5).round
      when :hp
        calculate_stat(:st) + @tunings[:hp]
      when :wl
        calculate_stat(:iq) + @tunings[:wl]
      when :per
        calculate_stat(:iq) + @tunings[:per]
      else
    end
  end

  def verify_stat(attr)
    stat_value = calculate_stat(attr)
    case
      when (attr == :wl || attr == :per) && (stat_value > 20 || stat_value < 4)
        result = false
      else
        result = true
    end
    result
  end

  def calculate_points
    result = powerlevel
    result -= (@tunings[:st] + @tunings[:ht]) * 10 + (@tunings[:dx] + @tunings[:iq]) * 20 \
              + @tunings[:hp] * 2 + @tunings[:wl] * 5 + @tunings[:per] * 5
    @points = result
  end

  def effective_stats
    result = {}
    [:st, :dx, :ht, :iq, :bl, :hp, :wl, :per].each { |stat|
      result[stat] = calculate_stat(stat)
    }
    result
  end

  def attr_change(attr, levels)
    @tunings[attr] += levels
    if verify_stat(attr)
      calculate_points
    else
      @tunings[attr] -= levels
    end
  end

end
