require './lib/binary_search_tree'
puts "Test binary_search_tree file"
array = Array.new(15) { rand(1..100) }#[1, 18, 2, 23, 54, 30, 22, 67, 72, 71, 84, 95, 74, 64,100,101]#[1,5,7,10,40, 50,60]#
tree = Tree.new(array)
tree.build_tree
puts "built tree"
tree.pretty_print
puts "Tree is balanced ?: #{tree.balanced?}"
puts "Level order: #{tree.level_order}"
puts "InOrder: #{tree.in_order}"
puts "PreOrder: #{tree.pre_order}"
puts "PostOrder: #{tree.post_order}"
array_to_desbalance = [101,110,120,101]
puts "Add data #{array_to_desbalance} to desbalance the tree"
array_to_desbalance.each{|item| tree.insert(item)}
tree.pretty_print
puts "Tree is balanced ?: #{tree.balanced?}"
puts "Rebalance the tree"
tree.rebalance
tree.pretty_print
puts "Tree is balanced ?: #{tree.balanced?}"
puts "Level order: #{tree.level_order}"
puts "InOrder: #{tree.in_order}"
puts "PreOrder: #{tree.pre_order}"
puts "PostOrder: #{tree.post_order}"