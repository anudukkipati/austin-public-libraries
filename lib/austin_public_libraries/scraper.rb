
class Scraper
    def self.scrape_library_locations_page
    
        libraryscraper = Nokogiri::HTML(open("https://library.austintexas.gov/locations"))
       
       # libraries = []
        libraryscraper.css("div.view-content div.apl-box").collect do |library|
            library_info = {}
            library_info[:name] = library.css("h2.pane-title a").text
            library_info[:address] = library.css("div.apl-address a").text
            library_info[:phone] = library.css("div.apl-phone div").text
            library_info[:hours] = library.css("div.views-field-field-open-hours-html").text
            library_info[:website] = library.css("h2.pane-title a").attribute("href").value
#libraries << library_info
            library_info
        end
      # libraries  
    end 
end



=begin
libraries : libraryscraper.css("div.view-content div.apl-box").first
libraryname : libraryscraper.css("h2.pane-title a").text
libraryaddress: library.css("div.apl-address a").text
library phone : library.css("div.apl-phone div").text
library hours: library.css("div.views-field-field-open-hours-html").text
library_url: library.css("h2.pane-title a").attribute("href").value
=end
=begin
library_profile_url = "https://library.austintexas.gov/central-library"
=end