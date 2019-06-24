class User
    attr_accessor :position, :orderHistory
    def initialize(position)
        @position = position
        @orderHistory = Array.new()
    end
    def AddOrder(order)
        @orderHistory<<order
    end
end    