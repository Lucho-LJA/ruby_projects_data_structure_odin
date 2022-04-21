class LinkedList
    def initialize
        @list = []
    end
    def to_s
        str = ""
        @list.each_with_index{|node, index| if index < @list.length then str += "(#{node.value}) -> " else str += "(#{node.value}) -> nil" end}
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

list1 = LinkedList.new
list1.append("val1")
list1.append("val2")
list1.append("val3")
list1.prepend("val0")

p list1.test
p list1.size
p list1.head
p list1.tail
p list1.at(2)
p list1.pop
p list1.test
p list1.contains?("val1")
p list1.contains?("val5")
p list1.find("val1")
p list1.find("val5")
p list1.to_s