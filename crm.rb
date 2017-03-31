require_relative 'contact'

class CRM

  @@screen_size = [35, 20]

  def initialize(first_name, last_name, email = "set later")
    Contact.create(first_name, last_name, email, "Me :)")
    @your_name = first_name
    @your_full_name = "#{first_name} #{last_name}"
    main_menu
  end

  def main_menu


  end

  def print_main_menu
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

  def print_contact
    puts "* Welcome to the Customer Relations Manager! *"
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
