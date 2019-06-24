class RouteShower
    def initialize(route)
        @route = route
    end
    def Show
        @route.each do |position|
            puts "Driver to #{position.x},#{position.y}"
        end
    end
end