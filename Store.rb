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