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
    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
    end
    private
    def insert_rec(root,key)
        return nil if root == nil
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
        node.left_child = build_tree_rec(array[0...array.length/2])
        node.right_child = build_tree_rec(array[array.length/2 + 1..-1])
        return node
    end
end
array = [1,2,3,4,5,6,7,8]
tree1 = Tree.new(array)
tree1.build_tree
#p tree1.root
tree1.insert(4)
#p tree1.root
p tree1.pretty_print