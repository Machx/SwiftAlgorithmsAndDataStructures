//: Playground - noun: a place where people can play

import UIKit
import XCTest

class StackTestCase : XCTestCase {
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	func testStack() {
		var stack = Stack<Int>()
		
		stack.push(1)
		stack.push(2)
		stack.push(3)
		
		XCTAssertEqual(stack.peek(), 3)
		XCTAssertEqual(stack.pop(), 3)
		
		XCTAssertEqual(stack.peek(), 2)
		XCTAssertEqual(stack.pop(), 2)
		
		XCTAssertEqual(stack.peek(), 1)
		XCTAssertEqual(stack.pop(), 1)
		
		XCTAssertNil(stack.peek())
		XCTAssertNil(stack.pop())
	}
}

StackTestCase.defaultTestSuite.run()
