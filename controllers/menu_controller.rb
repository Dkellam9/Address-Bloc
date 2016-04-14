require_relative '../models/address_book'

class MenuController
  attr_reader :address_book
  
  def initialize
    @address_book = AddressBook.new
  end
  
  def main_menu
    puts "Main Menu - #{address_book.entries.count}.entries"
    puts "1 - View All Entries"
    puts "2 - Create An Entry"
    puts "3 - Search For An Entry"
    puts "4 - Import Entries From A CSV"
    puts "5 - Exit"
    print "Enter Your Selection: "
    
    selection = gets.to_i
    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        puts "Good-bye!"
        exit(0)
      else 
        system "clear"
        puts "U wot m8?"
        main_menu
    end
  end
  
  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end
    system "clear"
    puts "End of Entries"
  end
  
  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp
    
    address_book.add_entry(name, phone, email)
    
    system "clear"
    puts "New Entry Created"
  end
  
  def search_entries
  end
  
  def read_csv
  end
  
  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp
    
    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end
end