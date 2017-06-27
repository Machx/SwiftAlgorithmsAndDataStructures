//: Playground - noun: a place where people can play

import Cocoa
import XCTest

class InsertionSortTestCase : XCTestCase {
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	func testBasicInsertionSort() {
		let numbers = [3,1,9,4,2,6]
		let numbers2 = numbers.insertionSort()
		
		XCTAssertEqual(numbers2, [1,2,3,4,6,9])
	}
	
	func testCaseWith1Value() {
		let number = [3]
		let number2 = number.insertionSort()

		XCTAssertEqual(number2, [3])
	}
}

InsertionSortTestCase.defaultTestSuite.run()
