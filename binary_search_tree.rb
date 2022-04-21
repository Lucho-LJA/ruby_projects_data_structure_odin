class Node
    attr_accessor :data, :left_child, :right_child
    def initialize(data)
        @data = data
        @left_child = nil
        @right_child = nil
    end
end
class Tree
    attr_reader :root
    def initialize(array=[])
        @array = array
        @root = nil
    end
    def build_tree
        @array.uniq!
        @array.sort!
        #@root = nil
        @root = build_tree_rec(@array)
    end
    def insert(key)
        @root = insert_rec(@root,key)
    end
    private
    def insert_rec(root,key)
        return Node.new(key) if root == nil
        #return @root if @root.data == key
        if key < root.data
            root.left_child = insert_rec(root.left_child,key)
        else 
            root.right_child = insert_rec(root.right_child,key)
        end
        root
    end
    def build_tree_rec(array)
        return nil if array == []
        node = Node.new(array[array.length/2])
        node.left_child = build_tree_rec(array[0...(array.length/2)])
        node.right_child = build_tree_rec(array[(array.length/2)...(array.length-1)])
        return node
    end
end
array = [1,2,3,4,5]
tree1 = Tree.new(array)
tree1.build_tree
#p tree1.root
tree1.insert(6)
p tree1.root