class StoreToHash
    def initialize(store)
        @store = store
    end
    def result
        Hash["name",@store.name,
            "position",PositionToHash.new(@store.position).result,
            "items",ItemsToHash.new(@store.items).result]
    end
end