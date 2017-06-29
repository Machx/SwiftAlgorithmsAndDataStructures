//: Playground - noun: a place where people can play

import UIKit
import XCTest

class LinkedListTest : XCTestCase {
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	func testLinkedList() {
		let list = LinkedList<Int>()
		
		list.add(30)
		list.add(50)
		
		XCTAssertTrue(list.contains(30))
		XCTAssertTrue(list.contains(50))
		XCTAssertFalse(list.contains(99))
	}
}

LinkedListTest.defaultTestSuite.run()
