class UI

  attr_accessor :width, :height

  def initialize(width, height)
    @width = width  #in characters
    @height = height #in lines
  end

  def print_menu(title, items)
    puts
    puts
    puts "**********************************************"
    puts "* Welcome to the Customer Relations Manager! *"
    puts "**********************************************"
    puts "* ===============MAIN MENU================== *"
    puts "* [B]rowse contacts                          *"
    puts "* [A]dd new contact                          *"
    puts "* [F]ind contact                             *"
    puts "* [S]eacth contacts                          *"
    puts "**********************************************"
    puts
    puts
  end


  def print_menu_item

  end

  def get_hash(keys)

  end

  def print_error

  end

  def get_value(key, name = nil)

  end


end
