class RouteToHash
    def initialize(route)
        @route = route
    end
    def result
        route = Array.new()
        @route.each do |position|
            route << PositionToHash.new(position).result
        end
        route
    end
end