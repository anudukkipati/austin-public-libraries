
class Library
    attr_accessor :name, :address, :phone, :hours, :website

    @@all = []

  def initialize(library_hash)
    library_hash.each do |key, value|
        self.send("#{key}=", value)
    end
    @@all << self
  end

    def self.create_from_locations_page(libraries_array)
        libraries_array.each do |hash|
            Library.new(hash)
        end
        
    end
  
    def self.all
        @@all
    end
    
end