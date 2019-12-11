Linked list

By I. Mahle

A project of The Odin Project: https://www.theodinproject.com/courses/ruby-programming/lessons/linked-lists

Instructions

1. Run ./linked_list.rb
2. Make changes to the input in the file linked_list.rb

Discussion
I used the following technologies: Ruby with classes and methods.
In this program I built a linked list which is one of the most basic and fundamental data structures in computer science. A linked list is a linear collection of data elements called nodes that “point” to the next node by means of a pointer. Each node holds a single element of data and a link or pointer to the next node in the list. A head node is the first node in the list, a tail node is the last node in the list.

My linked list class has the following methodes:

- appending adds a new node to the end of the list
- prepending adds a new node to the start of the list
- size returns the total number of nodes in the list
- head returns the first node in the list
- tail returns the last node in the list
- at(index) returns the node at the given index
- pop removes the last element from the list
- contains? returns true if the passed in value is in the list and otherwise returns false.
- find(data) returns the index of the node containing data, or nil if not found.
- to_s represent the LinkedList objects as strings, so that they can be printed out and previewed in the console. The format is: ( data ) -> ( data ) -> ( data ) -> nil
- insert_at(index) inserts the node at the given index
- remove_at(index) removes the node at the given index.

Requirements:
Ruby
