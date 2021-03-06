class Node
    attr_accessor :data, :left_child, :right_child
    def initialize(data)
        @data = data
        @left_child = nil
        @right_child = nil
    end
end
class Tree
    attr_reader :root, :array
    def initialize(array=[],root=nil)
        @array = array
        @root = root
    end
    def build_tree
        @array.uniq!
        @array.sort!
        #@root = nil
        @root = build_tree_rec(@array)
    end
    def insert(key)
        @root = insert_rec(@root,key) if @array != []
        if @array == []
            @array = [key]
            build_tree
        end
        @root
    end
    def pretty_print(node = @root, prefix = '', is_left = true)
        if node
            pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
            puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
            pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
        else
            puts "└── nil"
        end
    end
    def delete(key)
        @root = delete_rec(@root,key)
    end
    def find(key)
        #find_rec(@root,key)
        Tree.new([],find_rec(@root,key))
    end
    def level_order(root = @root)
        return nil if root == nil
        output = []
        queue = []
        queue.push(root)
        until queue.empty? do
            current = queue.shift
            output.push(current.data)
            queue.push(current.left_child) if current.left_child
            queue.push(current.right_child) if current.right_child
        end
        output
    end
    def in_order
        in_order_rec
    end
    def pre_order
        pre_order_rec
    end
    def post_order
        post_order_rec
    end
    def height(key)
        root = find(key)
        height_rec(root.root)
    end
    def depth(key)
        depth_rec(key) if find(key).root
    end
    def balanced?
        ((height(@root.left_child.data) - height(@root.right_child.data)).abs <= 1 ? true : false )
    end
    def rebalance
        @array = in_order
        build_tree
    end

    private
    def depth_rec(key,root = @root, cont = 0)
        val1 = 0
        val2 = 0
        return cont * 0 if !root
        return cont + 1 if root.data == key
        val1 = depth_rec(key,root.left_child, cont + 1)
        val2 = depth_rec(key,root.right_child, cont + 1)
        [val1, val2].max
    end
    def height_rec(root)
        val1 = 0
        val2 = 0
        return 0 if !root
        val1 = height_rec(root.left_child) + 1
        val2 = height_rec(root.right_child) + 1
        [val1,val2].max
    end
    def post_order_rec(root = @root)
        return nil if root == nil
        return [root.data] if (root.left_child == nil  and root.right_child == nil)
        vals = [root.data]
        aux1 = []
        aux2 = []
        aux1 = post_order_rec(root.left_child) if root.left_child
        aux2 = post_order_rec(root.right_child) if root.right_child
        
        aux1 + aux2 + vals

    end
    def pre_order_rec(root = @root)
        return nil if root == nil
        #return [root.data] if (root.left_child == nil  and root.right_child == nil)
        vals = [root.data]
        aux1 = []
        aux2 = []
        aux1 = pre_order_rec(root.left_child) if root.left_child
        aux2 = pre_order_rec(root.right_child) if root.right_child
        vals + aux1 + aux2
    end
    def in_order_rec(root = @root)
        return nil if root == nil
        return [root.data] if (root.left_child == nil  and root.right_child == nil)
        vals = [root.data]
        aux1 = []
        aux2 = []
        aux1 = in_order_rec(root.left_child) if root.left_child
        aux2 = in_order_rec(root.right_child) if root.right_child
        aux1 + vals + aux2

    end
    def find_rec(root,key)
        return nil if root == nil
        return root if key == root.data
        root_aux = find_rec(root.left_child, key)
        if root_aux == nil
            root_aux = find_rec(root.right_child, key)
        end
        return root_aux
    end
    def min_val(root)
        val = root
        unless val.left_child == nil
            val = val.left_child
        end
        val
    end
    def delete_rec(root,key)
        return nil if root == nil
        #return @root if @root.data == key
        if key < root.data
            root.left_child = delete_rec(root.left_child,key)
        elsif key > root.data
            root.right_child = delete_rec(root.right_child,key)
        else
            if !root.left_child
                temp = root.right_child
                root = nil
                return temp
            elsif !root.right_child
                temp = root.left_child
                root = nil
                return temp
            end
            temp = min_val(root.right_child)
            root.data = temp.data
            root.right_child = delete_rec(root.right_child,temp.data)
        end
        root
    end
    def insert_rec(root,key)
        return nil if root == nil
        return root if root.data == key
        if key < root.data
            root.left_child = insert_rec(root.left_child,key) if root.left_child
            root.left_child = Node.new(key) if !root.left_child
        else 
            root.right_child = insert_rec(root.right_child,key) if root.right_child
            root.right_child = Node.new(key) if !root.right_child
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