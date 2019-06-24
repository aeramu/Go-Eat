class OrderHistoryShower
    def initialize(orderHistory)
        @orderHistory = orderHistory
    end
    def Show
        @orderHistory.each do |order|
            puts "Store Name: #{order.storeName}"
            puts "Driver Name:  #{order.driverName}"
            puts "Ordered Items:"
            order.orderedItems.each do |key, value|
                puts "#{key.name} : #{value}"
            end
            puts "Total Cost: #{order.totalCost}"
        end
    end
end