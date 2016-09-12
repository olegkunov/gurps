
module CLI
  def run(hc)
    continue = true
    while continue
      puts "<q> to quit"
      input = gets
      case input
        when "q\n"
          continue = false
        when "ba\n"
          basic_attributes(hc)
        else

      end
    end
  end

  def basic_attributes(hc)
    continue = true
    while continue
      p hc.basic_attributes
      puts "#{hc.points} points"
      puts "<ba> to exit"
      input = gets
      case input
        when "ba\n"
          continue = false
        when "st+\n"
          hc.basic_attr_change(:st, 1)
        when "st-\n"
          hc.basic_attr_change(:st, -1)
        when "dx+\n"
          hc.basic_attr_change(:dx, 1)
        when "dx-\n"
          hc.basic_attr_change(:dx, -1)
        when "iq+\n"
          hc.basic_attr_change(:iq, 1)
        when "iq-\n"
          hc.basic_attr_change(:iq, -1)
        when "ht+\n"
          hc.basic_attr_change(:ht, 1)
        when "ht-\n"
          hc.basic_attr_change(:ht, -1)
        else

      end
    end
  end
end
