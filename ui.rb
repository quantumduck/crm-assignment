require 'io/console'

class UI

  attr_reader :max_width, :max_height

  def initialize
    @max_height, @max_width = $stdin.winsize
    # puts "Your screen is #{max_width} wide and #{max_height} tall"
  end

  def print_menu(title, items, start_at = 0)
    # Centre the title
    padding = title.to_s.length < (max_width - 6)
    if (padding > 0)
      padleft = padding / 2
      padright = padding - padleft
      title = (' ' * padleft) + title + (' ' * padright)
    end

    # if starting at higher index, indicate scrolling option:
    if (start_at > 0)
      items = items[start_at, items.length - start_at]
      puts "** ^^" + ('*' * (max_width - 8)) + "^^ **"
    print_menu_item(title)
    puts '*' * max_width
    # Print as many items as will fit on screen.
    lines_left = ((max_height - 5) - items.to_a.length)
    if lines_left >= 1
      # Print the whole menu + bottom border and padding
      items.each { |item| print_menu_item(item) }
      puts '*' * max_width
      lines_left.times { puts }
    elsif lines left == 0
      # Print the whole menu + bottom border
      items.each { |item| print_menu_item(item) }
      puts '*' * max_width
    else
      lines_left.times
    end


  end


  def print_menu_item(item, pfix = nil)
    line =
    case pfix.class
    when Integer
      line = "** " + pfix.to_s + ": " + item.to_s
    when String
      line = "** " + pfix + item.to_s
    else
      line = "** " + item.to_s
    end
    if (line.length > (max_width - 3))
      line = line.to_s[0, max_width - 3] + "..."
    else
      line = line.to_s + (" " * (max_width - line.length - 3)) + " **"
    end
    puts line
  end

  def get_hash(keys)

  end

  def print_error

  end

  def get_value(key, name = nil)

  end


end
