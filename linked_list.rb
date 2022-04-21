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
puts "\nCreate a Linked list (list1) in blank"
list1 = LinkedList.new
puts "Add nodes in the last"
list1.append("val1")
list1.append("val2")
list1.append("val3")
p list1.test
puts "\nAdd node at the beggining"
list1.prepend("val0")
p list1.test
puts "\nGet the List size"
p list1.size
puts "\nGet the first node"
p list1.head
puts "\nGet the last node"
p list1.tail
puts "\nGet a node input its index"
p list1.at(2)
puts "\nRemove last node"
puts "Before: #{list1.test}"
list1.pop
puts "After: #{list1.test}"
puts "\nAsk if a node exist"
puts "Original: #{list1.test}"
puts "exist: val1 -> result: #{list1.contains?("val1")}"
puts "exist: val5 -> result: #{list1.contains?("val5")}"
puts "\nAsk if a node exist and return your index"
puts "Original: #{list1.test}"
puts "exist: val1 -> result: #{list1.find("val1")}"
puts "exist: val5 -> result: #{list1.find("val5")}"
puts "\nShow nodes structure"
p list1.to_s
puts "\nInsert node or nodes given a index as initial position"
puts "Original: #{list1.test}"
list1.insert_at(1,"val11","val12")
p list1.test
puts "\nRemove node given a index"
puts "Original: #{list1.test}"
list1.remove_at(3)
p list1.test
array_init = ["v2_0","v2_1","v2_3"]
puts "\n\nCreate another list with initial data in array: #{array_init}"
list2 = LinkedList.new(array_init)
puts "\nList 2: #{list1.test}"
puts "\nStructure of list2"
p list2.to_s