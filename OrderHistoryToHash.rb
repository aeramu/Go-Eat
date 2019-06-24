class OrderHistoryToHash
    def initialize(orderHistory)
        @orderHistory = orderHistory
    end
    def result
        orderHistory = Array.new()
        @orderHistory.each do |order|
            orderHistory << OrderToHash.new(order).result
        end
        orderHistory
    end
end