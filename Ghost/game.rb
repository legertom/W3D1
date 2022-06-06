require 'set'
require 'byebug'

class Game
    attr_reader :dictionary
    def initialize(players)
        players.each do |player|
            @players << player
        end
        @fragment = ""
        
        
        
        file = "dictionary.txt"
        @file_data = File.readlines.map(&:chomp)
        @dictionary = Set[@file_data]

    end
    #Set info: https://ruby-doc.org/stdlib-2.7.1/libdoc/set/rdoc/Set.html
    #File info: https://www.rubyguides.com/2015/05/working-with-files-ruby/

    
    debugger

end