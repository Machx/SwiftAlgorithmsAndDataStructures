/*
BSD 2-Clause License

Copyright (c) 2017, Colin Wheeler
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

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
	
	@discardableResult
	public func remove(_ value: T) -> Bool {
		guard let currentNode = self.head else { return false }
		
		if currentNode.value == value {
			self.head = self.head?.next
			return true
		} else {
			var node = self.head?.next
			var previousNode = self.head
			while node != nil {
				if node?.value == value {
					previousNode?.next = node?.next
					return true
				}
				previousNode = node
				node = node?.next
			}
		}
		
		return false
	}
}
