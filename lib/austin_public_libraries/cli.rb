
class CLI
    
    def call
       system('clear')

       puts "Welcome to Austin Public Libraries"
       
       make_libraries
       menu
    end
    def menu
        puts "Type 'list' to get a list of libraries"
        puts "Type 'exit' to exit program"
        menu_input
    end

    def menu_input
        
         input = gets.strip
         if input.downcase == "list"
            list_libraries
            sub_menu
         elsif input.downcase == "exit"
            goodbye
         else
            invalid_choice
            menu
         end
    end
    def sub_menu
        puts "Type number associated with a library for more details about a library"
        puts "Type 'exit' to exit program"
        sub_menu_input
      end
    
    def sub_menu_input
        input = gets.strip.to_i
        if (1..Library.all.length).include?(input)
            library = Library.all[input - 1]
            print_library_details(library)
            continue?
        elsif input == "exit"
            goodbye
        else
            invalid_choice
            sub_menu
        end
    end
    def make_libraries
        libraries_array = Scraper.scrape_library_locations_page
        Library.create_from_locations_page(libraries_array)
         
    end

    
    def list_libraries
        Library.all.each_with_index do |library, index|
            puts "#{index + 1}. #{library.name}"
        end   
    end

    def print_library_details(library)
        puts "-----------------------------------------------------------"
        puts "Name: #{library.name.upcase}"
        puts "Address: #{library.address}"
        puts "Phone: #{library.phone}"
        puts "Hours of Operation:\n #{library.hours}"
        puts "Website: https://library.austintexas.gov#{library.website}"
        puts "-----------------------------------------------------------"

    end
    
    def continue?
        puts "Type '1' for menu, '2' to choose another library, 'exit' to exit the program"

        input = gets.strip
        if input == "1"
            menu
          elsif input == "2"
            list_libraries
            sub_menu
          elsif input == "exit"
            goodbye
          else
            invalid_choice
            continue?
          end
    end

    def goodbye
        puts "Thank you for using the Austin Public Libraries Gem! Goodbye!"
    end
    def invalid_choice
        puts "I don't understand that input, try again!"
    end
    # binding.pry
    # puts"welcome"
end