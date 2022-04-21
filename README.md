# Odin Project: Data Structure with Ruby
Odin Projects about 3 data structure with Ruby
## Instructions
- Clone repository in local machine
- Place at the root of cloned folder
- Run comman to different projects
    - LINKED LIST: ruby linked_list.rb
## Description
### Linked List
The [Project about Linked lists](src/linked_list.rb) is about creating of linked lists with 2 class.
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
- remove_at(index): Removes the node at the given index.
- test: Output the array of list with nodes. The node is represent with one array where be it value and it index.
