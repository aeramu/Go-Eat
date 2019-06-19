class ObjectMap
    def  initialize(size)
        @size = size
        @objectMap = Array.new(size){Array.new(size)}
    end

    def Add(objectID)
        @objectMap[ObjectSpace._id2ref(objectID).position.x][ObjectSpace._id2ref(objectID).position.y] = ObjectSpace._id2ref(objectID)
    end

    def Get(position)
        @objectMap[position.x][position.y]
    end
end
class VisualMap
    def initialize(size)
        @size = size
        @visualMap = Array.new(size){Array.new(size,".")}
    end

    def Add(objectID)
        if ObjectSpace._id2ref(objectID).class == User
            @visualMap[ObjectSpace._id2ref(objectID).position.x][ObjectSpace._id2ref(objectID).position.y] = "U"
        elsif ObjectSpace._id2ref(objectID).class == Store
            @visualMap[ObjectSpace._id2ref(objectID).position.x][ObjectSpace._id2ref(objectID).position.y] = "S"
        elsif ObjectSpace._id2ref(objectID).class == Driver
            @visualMap[ObjectSpace._id2ref(objectID).position.x][ObjectSpace._id2ref(objectID).position.y] = "D"
        end
    end

    def Show
        @size.times do |i|
            @size.times do |j|
                print @visualMap[i][j]
            end
            puts
        end
    end
end
class Map
    attr_reader :size
    def initialize(size)
        @objectMap = ObjectMap.new(size)
        @visualMap = VisualMap.new(size)
        @size = size
    end
    def Add(objectID)
        @objectMap.Add(objectID)
        @visualMap.Add(objectID)
    end
    def GetObject(position)
        @objectMap.Get(position)
    end
    def Show
        @visualMap.Show
    end
    def isInside(position)
        position.x>=0&&position.x<@size&&position.y>=0&&position.y<@size
    end
end