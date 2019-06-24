class ObjectMap < Array
    def Add(object)
        self[object.position.x][object.position.y] = object
    end
    def Delete(position)
        self[position.x].delete_at(position.y)
    end
end