
module CLI
  def run(hc)
    continue = true
    while continue
      puts "<q> to quit"
      input = gets
      case input.chop
        when 'q' then continue = false
        when 'ba' then basic_attributes(hc)
        when 'sa' then secondary_attributes(hc)
        else
      end
    end
  end

  def basic_attributes(hc)
    continue = true
    while continue
      p hc.effective_stats
      puts "#{hc.points} points"
      puts 'Basic attributes: <st>, <dx>, <iq>, <ht>. <q> to exit'
      input = gets
      case input.chop
        when 'q' then continue = false
        when 'st+' then hc.attr_change(:st, 1)
        when 'st-' then hc.attr_change(:st, -1)
        when 'dx+' then hc.attr_change(:dx, 1)
        when 'dx-' then hc.attr_change(:dx, -1)
        when 'iq+' then hc.attr_change(:iq, 1)
        when 'iq-' then hc.attr_change(:iq, -1)
        when 'ht+' then hc.attr_change(:ht, 1)
        when 'ht-' then hc.attr_change(:ht, -1)
        else
      end
    end
  end

  def secondary_attributes(hc)
    continue = true
    while continue
      p hc.effective_stats
      puts "#{hc.points} points"
      puts 'Secondary attributes: <hp>. <q> to exit'
      input = gets
      case input.chop
        when 'q' then continue = false
        when 'hp+' then hc.attr_change(:hp, 1)
        when 'hp-' then hc.attr_change(:hp, -1)
        when 'wl+' then hc.attr_change(:wl, 1)
        when 'wl-' then hc.attr_change(:wl, -1)
        else
      end
    end
  end

end
