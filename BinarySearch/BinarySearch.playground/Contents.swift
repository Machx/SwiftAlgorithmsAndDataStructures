//: Playground - noun: a place where people can play

import UIKit
import XCTest

let numbers = [3, 5, 9, 15, 29, 34, 35, 39, 42, 56, 75, 89, 90]

class BinarySearchTestCase : XCTestCase {
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	func testBinarySearch() {
		XCTAssertTrue(numbers.binarySearchContains(3))
		XCTAssertTrue(numbers.binarySearchContains(34))
		XCTAssertTrue(numbers.binarySearchContains(90))
		
		XCTAssertFalse(numbers.binarySearchContains(99))
		XCTAssertFalse(numbers.binarySearchContains(-9))
	}
}

BinarySearchTestCase.defaultTestSuite.run()
