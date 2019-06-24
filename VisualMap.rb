class VisualMap < Array
    def Add(object)
        if object.class == User
            self[object.position.x][object.position.y] = "U"
        elsif object.class == Store
            self[object.position.x][object.position.y] = "S"
        elsif object.class == Driver
            self[object.position.x][object.position.y] = "D"
        end
    end
    def Delete(position)
        self[position.x][position.y] = "."
    end
end