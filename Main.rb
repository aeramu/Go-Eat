require_relative 'Store'
require_relative 'Position'
require_relative 'Driver'
require_relative 'RandomGenerator'
require_relative 'Map'
require_relative 'BFS'
require_relative 'User'
require_relative 'FileHandler'
require_relative 'Menu'
require 'json'

def PrintOrderedList(*list,last)
    i = 0
    list.each do |elem|
        i+=1
        print i,". ",elem.to_s
        puts
    end
    print "99. ",last
    puts
end
def mapInitialization(argumentArray)
    if argumentArray[0].class == NilClass
        map = Map.new(20)
        map.Add(User.new(RandomGenerator.Position(10)).object_id)
        RandomGenerator.Map(map)
    else
        if argumentArray[1].class == NilClass
            map = FileHandler.Read(argumentArray[0])
        else
            map = Map.new(argumentArray[0].to_i)
            map.Add(User.new(Position.new(argumentArray[1].to_i,argumentArray[2].to_i)).object_id)
            RandomGenerator.Map(map)
        end
    end
    map
end

argumentArray = ARGV
$map = mapInitialization(argumentArray)
ARGV.clear
Menu.MainMenu