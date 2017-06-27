import Foundation

public struct Stack<T: Comparable> {
	fileprivate var store: [T]
	
	public mutating func push(_ value: T) {
		self.store.append(value)
	}
	
	public mutating func pop() -> T? {
		guard self.store.count > 0 else { return nil }
		let value = self.store.remove(at: self.store.count - 1)
		return value
	}
	
	public func peek() -> T? {
		guard self.store.count > 0 else { return nil }
		return self.store[self.store.count - 1]
	}
}

extension Stack {
	public init() {
		self.store = [T]()
	}
}
