//: Playground - noun: a place where people can play

import UIKit

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
		let trie = Trie<Int>()
		
		trie.set(30, forKey: "Colin")
		trie.set(31, forKey: "Carl")
		trie.set(32, forKey: "Himiko")
		
		XCTAssertEqual(trie.value(forKey: "Colin"), 30)
		XCTAssertEqual(trie.value(forKey: "Carl"), 31)
		XCTAssertEqual(trie.value(forKey: "Himiko"), 32)
		
		XCTAssertNil(trie.value(forKey: "shouldn't return a value"))
	}
	
	func testLinkedListRemoval() {
		let trie = Trie<Int>()
		
		trie.set(30, forKey: "Colin")
		trie.set(31, forKey: "Carl")
		trie.set(32, forKey: "Himiko")
		
		XCTAssertEqual(trie.value(forKey: "Colin"), 30)
		XCTAssertEqual(trie.value(forKey: "Carl"), 31)
		XCTAssertEqual(trie.value(forKey: "Himiko"), 32)
		
		XCTAssertTrue(trie.remove(valueFor: "Carl"))
		XCTAssertFalse(trie.remove(valueFor: "Carline"))
		
		XCTAssertNil(trie.value(forKey: "Carl"))
	}
	
	func testCaseSensitivity() {
		let trie = Trie<Int>(caseSensitive: false)
		
		trie.set(30, forKey: "HIMIKO")
		
		XCTAssertEqual(trie.value(forKey: "himiko"), 30)
	}
}

LinkedListTest.defaultTestSuite.run()
