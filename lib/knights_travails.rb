class Knight
    attr_reader :location, :parent
    def initialize(data, parent = nil)
      @location = data
      @parent = parent
    end
end
class Board
  
    def knight_moves(origin, destination)
        dest = make_tree(destination, origin)
    end
  
    private
    def find_moves(location, res = [])
        moves = [[2, 1], [1, 2], [2, -1], [1, -2], [-2, 1], [-1, 2], [-2, -1], [-1, -2]].freeze
        moves.each do |move|
            destination = [location[0] + move[0], location[1] + move[1]]
            res << destination if destination[0].between?(0, 7) and destination[1].between?(0, 7)
        end
        res
    end
    def make_tree(dest, depa)
        queue = [Knight.new(depa)]
        current = queue.shift
        until current.location == dest
            moves = find_moves(current.location)
            moves.each do |move|
                node = Knight.new(move, current)
                queue << node
            end
            current = queue.shift
        end
        current
    end
  
end

option = Board.new
option.knight_moves([3,3],[4,3])

