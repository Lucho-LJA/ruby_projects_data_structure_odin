class LinkedList
    def initialize(*nodes)
        @list = []
        nodes[0].each{|value| append(value)} unless nodes == []
    end
    def remove_at(index)
        @list.delete_at(index)
        @list.each_with_index{|node,index| if index < @list.length-1 then node.next_node = index + 1 else node.next_node = nil end}
    end
    def insert_at(index,*value)
        value.reverse!
        value.each{|val| @list.insert(index,Node.new(val))}
        @list.each_with_index{|node,index| if index < @list.length-1 then node.next_node = index + 1 else node.next_node = nil end}
    end
    def to_s
        str = ""
        @list.each_with_index{|node, index| if index < @list.length-1 then str += "(#{node.value}) -> " else str += "(#{node.value}) -> nil" end}
        str
    end
    def find(val)
        @list.each_with_index{|node, index| return index if node.value == val}
        nil
    end
    def contains?(val)
        @list.each{|node| return true if node.value == val}
        false
    end
    def pop
        @list.pop
        @list[-1].next_node = nil
    end
    def at(index)
        @list[index].value
    end
    def tail
        @list[-1].value
    end
    def head
        @list[0].value
    end
    def size
        @list.length
    end
    def prepend(value)
        @list.unshift(Node.new(value))
        @list.each_with_index{|node,index| node.next_node = index + 1 if index < @list.length-1}
    end
    def append(value)
        @list.push(Node.new(value))
        @list[-2].next_node = @list.length - 1 if @list.length > 1
    end

    def test
        val = []
        @list.each{|node| val << [node.value,node.next_node]}
        val
    end

end

class Node
    attr_accessor :value, :next_node
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end

end
