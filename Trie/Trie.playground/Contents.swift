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
