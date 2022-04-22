# Odin Project: Data Structure with Ruby
Odin Projects about 3 data structure with Ruby
## Instructions
- Clone repository in local machine
- Place at the root of cloned folder
- Run comman to different projects
    - LINKED LIST: ./tests/test_ruby linked_list.
    - BINARY SEARCH TREE: ruby ./tests/test_binary_search_tree.rb
## Description
### Linked List
The [Project about Linked lists](src/lib/linked_list.rb) is about creating of linked lists with 2 class.
#### Node class
This create a Node object with the principal structure: Head (Value) and Next.
The class is used inside the LinkedList class.
#### LinkedList class
This class create a List Structure using a array named @list where save nodes create with data.
The class have some methods to init and modificate the structe.
- #initilize(data): Init the structure with data in array. if there is data, create a empty List
- #append(value): Adds a new node containing value to the end of the list
- #prepend(value): Adds a new node containing value to the start of the list
- #size: Returns the total number of nodes in the list
- #head: Returns the first node in the list
- #tail: Returns the last node in the list
- #at(index): Returns the node at the given index
- #pop: Removes the last element from the list
- #contains?(value): Returns true if the passed in value is in the list and otherwise returns false.
- #find(value): Returns the index of the node containing value, or nil if not found.
- #to_s: Represent the LinkedList objects as strings, The format is: ( value ) -> ( value ) -> ( value ) -> nil
- #insert_at(index,*values): Inserts a new node/s with the provided value at the given index.
- #remove_at(index): Removes the node at the given index.
- #test: Output the array of list with nodes. The node is represent with one array where be it value and it index.
### Binary Search Tree
The [Project about Binary Search Tree](src/lib/binary_search_tree.rb) is about creating a Binary search tree object with a initial data and 2 class essentially .
#### Node class
This create a Node object with the principal structure: data (Value), left_child and right_child.
The class is used inside the Tree class and the left and right child have other Node class when the tree is built.
#### Tree class
This class create a binary tree with a array. When a object is create is necesary a array, if array is empty
or the object is created without parameters the Tree is null and is necesary to insert data before used. 
The class have some methods to init and modificate the structe.
- #initilize(data): Init the structure with data in array. if there isn't data, create a empty List
- #build_tree: Takes an array of data which was input when it was instantiated and turns it into a balanced binary tree full of Node objects appropriately placed.
- #insert(node_value): Add a element in the tree following the instructions
- #delete(node_value): Remove a element of the tree and if it don't exist, return the same tree
- #find(node_value): Accept a value and return the subs-tree node's value as the root. Return nil if the value don't exist.
- #level_order: Returns one array with the data found when traversing the tree in breadth-first level order
- #in_order: Return one array with the data found when traversing the tree in depth-first order : inOrder.
- #pre_order: Return one array with the data found when traversing the tree in depth-first order : preOrder.
- post_order: Return one array with the data found when traversing the tree in depth-first order : postOrder.
- #height(node_value): Accept a node and returns its height. Height is defined as the number of edges in longest path from a given node to a leaf node.
- #depth(node_value): Accept a node and returns its depth. Depth is defined as the number of edges in path from a given node to the tree’s root node.
- #balanced?: Checks if the tree is balanced. A balanced tree is one where the difference between heights of left subtree and right subtree of every node is not more than 1.
- #rebalance: Rebalances an unbalanced tree
