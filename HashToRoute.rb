class HashToRoute
    def initialize(hash)
        @hash = hash
    end
    def result
        route = Array.new()
        @hash.each do |position|
            route << HashToPosition.new(position).result
        end
        route
    end
end