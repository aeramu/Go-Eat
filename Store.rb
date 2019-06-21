class Item
    attr_accessor :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
    def self.FromHash(hash)
        Item.new(hash["name"],hash["price"])
    end
    def to_hash
        hash = Hash.new()
        hash["name"] = @name
        hash["price"] = @price
        hash
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
    def to_hash
        hash = Hash.new()
        hash["name"]=@name
        hash["position"]=@position.to_hash
        items = Array.new()
        @items.each do |elem|
            items << elem.to_hash
        end
        hash["items"]=items
        hash
    end
end