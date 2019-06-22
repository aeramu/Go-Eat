class User
    attr_accessor :position
    @@orderHistory = Array.new()
    def initialize(position)
        @@position = position
    end
    def position
        @@position
    end
    def self.position
        @@position
    end
    def self.AddOrder(order)
        @@orderHistory<<order
    end
    def self.orderHistoryHash
        orderHistory = Array.new()
        @@orderHistory.each do |elem|
            orderHistory << elem.to_hash
        end
        orderHistory
    end
    def self.ShowHistory
        @@orderHistory.each do |elem|
            puts "Store Name: #{elem.storeName}"
            puts "Driver Name:  #{elem.driverName}"
            puts "Ordered Items:"
            elem.orderedItems.each do |key, value|
                print key.name,": ",value
                puts
            end
            puts "Total Cost: #{elem.totalCost}"
        end
    end
end

class Order
    attr_accessor :orderedItems, :totalCost
    attr_accessor :routeToStore, :routeToUser
    attr_accessor :storeName, :driverName
    def initialize(storeName,driverName,orderedItems,routeToStore,routeToUser,totalCost)
        @storeName = storeName
        @driverName = driverName
        @orderedItems = orderedItems
        @routeToStore = routeToStore
        @routeToUser = routeToUser
        @totalCost = totalCost
    end
    def self.MakeOrder(store)
        storeName = store.name
        @searchDriver = BFS.new(store.position,Driver)
        driverName = @searchDriver.object.name
        orderedItems = Hash.new(0)
        routeToStore = @searchDriver.route.reverse
        routeToUser = BFS.new(store.position,User).route
        totalCost = (routeToUser.length-1)*3000
        Order.new(storeName,driverName,orderedItems,routeToStore,routeToUser,totalCost)
    end
    def AddItem(item, count)
        @totalCost += item.price*count
        @orderedItems[item] += count
    end
    def to_hash
        hash = Hash.new()
        hash["storeName"] = @storeName
        hash["driverName"] = @driverName
        orderedItems = Array.new()
        @orderedItems.each do |key,value|
            itemHash = Hash.new()
            itemHash["key"] = key.to_hash
            itemHash["value"] = value
            orderedItems << itemHash
        end
        hash["orderedItems"] = orderedItems
        routeToStore = Array.new()
        @routeToStore.each do |position|
            routeToStore << position.to_hash
        end
        hash["routeToStore"] = routeToStore
        routeToUser = Array.new()
        @routeToUser.each do |position|
            routeToUser << position.to_hash
        end
        hash["routeToUser"] = routeToUser
        hash["totalCost"] = @totalCost
        hash    
    end
end