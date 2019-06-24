class ItemToHash
    def initialize(item)
        @item = item
    end
    def result
        hash = Hash["name",@item.name,"price",@item.price]
    end
end