require_relative 'contact', 'ui'

class CRM

  def initialize(first_name, last_name, email = "set later")
    Contact.create(first_name, last_name, email, "Me :)")
    @your_name = first_name
    @your_full_name = "#{first_name} #{last_name}"
    @user_interface = UI.new(35,20)
    main_menu
  end

  def main_menu
    @user_interface.print_main_menu
    case gets.chomp.upcase[0]
    when 'A'
      puts "Add new contact:"
      puts "First name ?"
      fn = gets.chomp
    when 'B'
      display_all_contacts
    when 'F'
    end
  end


  def print_contact(ct)
    line = "* "
    if (ct.full_name.length <= (@@screen_size[0] - 4))
      line += ct.full_name
      line += " " * (@@screen_size[0] - ct.full_name.length - 4)
      line += " *"
    else
      line += ct.full_name[0, @@screen_size[0] - 4]
      line += ">*"
    end
    puts line
    line2 = "*" + " " * (@@screen_size[0] - 2) + "*"
    puts line2
  end

  def call_option

  end

  def add_new_contact

  end

  def modify_existing_contact

  end

  def delete_contact

  end

  def display_all_contacts

  end

  def search_by_attribute

  end


end
