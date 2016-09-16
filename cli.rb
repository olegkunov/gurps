
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

  def attr_change(hc, input, attr_dir)
    attr = attr_dir[:attr]
    length = if attr_dir[:len] then attr_dir[:len] else 2 end
    # coeff = if attr_dir[:dir] == :plus then 1; else -1 end
    levels = input[length..-1]
    levels =
        case
          when levels == '+'
            1
          when levels == '-'
            -1
          else
            levels.to_i
        end
    hc.attr_change(attr, levels)
  end

  def basic_attributes(hc)

    continue = true
    while continue
      p hc.effective_stats
      puts "#{hc.points} points"
      puts 'Basic attributes: <st>, <dx>, <iq>, <ht>. <q> to exit'
      input = gets.chop
      attr_dir =
          case input
            when 'q' then continue = false; nil
            when /^st\+/ then { attr: :st, dir: :plus }
            when /^st\-/ then { attr: :st, dir: :minus }
            when /^dx\+/ then { attr: :dx, dir: :plus }
            when /^dx\-/ then { attr: :dx, dir: :minus }
            when /^iq\+/ then { attr: :iq, dir: :plus }
            when /^iq\-/ then { attr: :iq, dir: :minus }
            when /^ht\+/ then { attr: :ht, dir: :plus }
            when /^ht\-/ then { attr: :ht, dir: :minus }
            else
          end
      attr_change(hc, input, attr_dir) unless attr_dir.nil?
    end
  end

  def secondary_attributes(hc)
    continue = true
    while continue
      p hc.effective_stats
      puts "#{hc.points} points"
      puts 'Secondary attributes: <hp>, <wl>, <per>. <q> to exit'
      input = gets.chop
      attr_dir =
          case input
            when 'q' then continue = false; nil
            when /^hp\+/ then { attr: :hp }
            when /^hp\-/ then { attr: :hp }
            when /^wl\+/ then { attr: :wl }
            when /^wl\-/ then { attr: :wl }
            when /^per\+/ then { attr: :per, len: 3 }
            when /^per\-/ then { attr: :per, len: 3 }
            else
          end
      attr_change(hc, input, attr_dir) unless attr_dir.nil?
    end
  end

end
