import Foundation

public final class LinkedList<T: Comparable> {
	
	private final class LinkedListNode {
		var value: T
		var next: LinkedListNode?
		
		init(value: T, next: LinkedListNode?) {
			self.value = value
			self.next = next
		}
		
		convenience init(_ value: T) {
			self.init(value: value, next: nil)
		}
	}
	
	private var head: LinkedListNode?
	
	private init(head: LinkedListNode?) {
		self.head = head
	}
	
	public convenience init() {
		self.init(head: nil)
	}
	
	public func add(_ value: T) {
		guard var currentNode = self.head else {
			self.head = LinkedListNode(value)
			return
		}
		
		while currentNode.next != nil {
			currentNode = currentNode.next!
		}
		currentNode.next = LinkedListNode(value)
	}
	
	public func contains(_ value: T) -> Bool {
		guard var currentNode = self.head else { return false }
		
		while currentNode.next != nil {
			if currentNode.value == value {
				return true
			}
			currentNode = currentNode.next!
		}
		if currentNode.value == value {
			return true
		}
		
		return false
	}
}
