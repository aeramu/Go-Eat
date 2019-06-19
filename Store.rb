class Item
    attr_accessor :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
end

class Store
    attr_accessor :name,:items, :position
    @@list = Array.new
    def initialize(name, position, items)
        @name = name
        @position = position
        @items = items
        @@list << self
    end
    def self.list
        @@list
    end
end