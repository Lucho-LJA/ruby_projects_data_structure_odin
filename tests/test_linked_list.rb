require './lib/linked_list'
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