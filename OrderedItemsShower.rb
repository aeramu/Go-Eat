class OrderedItemsShower
    def initialize(orderedItems)
        @orderedItems = orderedItems
    end
    def Show
        @orderedItems.each do |key,value|
            puts "#{key.name}(Rp. #{key.price}): #{value}"
        end
    end
end