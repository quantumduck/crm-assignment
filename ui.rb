require 'io/console'

class UI

  @@keyL = "\e[D"
  @@keyR = "\e[C"
  @@keyU = "\e[A"
  @@keyD = "\e[B"
  @@min_width = 16
  @@min_height = 6

  attr_reader :max_width, :max_height

  def initialize
    @max_height, @max_width = $stdin.winsize
    # puts "Your screen is #{max_width} wide and #{max_height} tall"
    # Warn if the screen is shorter than hard coded lines.
    if (@max_width < @@min_width)
      puts "Warning: Your screen is less than #{@@min_width} characters wide."
      puts "Resize window if possible and then press [Enter]"
      gets
      @max_height, @max_width = $stdin.winsize
    end
    if (@max_height < @@min_height)
      puts "Warning: Your screen is less than #{@@min_height} characters high."
      puts "Resize window if possible and then press [Enter]"
      gets
      @max_height, @max_width = $stdin.winsize
    end
  end

  def print_menu(title, items, start_at = 0, height = (max_height - 5))
    if ((height.to_i <= 0) || (height.to_i > (max_height - 5)))
      height = max_height - 5
    else
      heihgt = height.to_i
    end
    # Centre the title
    padding = (max_width - 6) - title.to_s.length
    if (padding > 0)
      padleft = padding / 2
      padright = padding - padleft
      title = (' ' * padleft) + title + (' ' * padright)
    end
    # Print menu title:
    puts '*' * max_width
    print_menu_item(title)
    # if starting at higher index, indicate scrolling option:
    if (start_at.to_i > 0)
      items = items[start_at, items.length - start_at.to_i]
      puts "***Scroll*[U]p" + ('*' * (max_width - 14))
    else
      puts '*' * (max_width)
    end
    # Print as many items as will fit on screen.
    lines_left = (height - items.to_a.length)
    if lines_left >= 1
      # Print the whole menu + bottom border and padding
      items.each { |item| print_menu_item(item) }
      puts '*' * max_width
      lines_left.times { puts }
    elsif lines_left == 0
      # Print the whole menu + bottom border
      items.each { |item| print_menu_item(item) }
      puts '*' * max_width
    else
      # Print as many lines as will fit and indicate
      # scrolling option.
      height.times { |i| print_menu_item(items[i]) }
      puts "***Scroll*[D]own" + ('*' * (max_width - 16))
    end
    lines_left
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

  def get_hash(keys, names = nil)
    hash = {}
    # Expect keys to be an array.
    if (prompts.length == keys.length)
      keys.length.times { |i| hash.store(keys[i], get_value(prompts[i])) }
    else
      keys.each { |k| hash.store(k, get_value) }
    end
    hash
  end

  def print_error(error)
    puts "ERROR: " + error.to_s
    puts "Press Enter to continue."
    gets
  end

  def get_value(name = nil)
    if (name == nil)
      puts "Please enter desired input:"
    else
      puts "#{name.to_s} = ?"
    end
    gets
  end


end
