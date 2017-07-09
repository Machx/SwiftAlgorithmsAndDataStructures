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

public final class Trie<T> {
	
	private final class TrieNode {
		let keyValue: Character?
		var value: T?
		var children: [TrieNode]
		
		init(keyValue: Character?, value: T?, children: [TrieNode]) {
			self.keyValue = keyValue
			self.value = value
			self.children = children
		}
		
		convenience init(keyValue: Character?) {
			self.init(keyValue: keyValue, value: nil, children: [])
		}
	}
	
	private var rootNode = TrieNode(keyValue: nil)
	public var caseSensitive: Bool = true
	
	private init(rootNode: TrieNode) {
		self.rootNode = rootNode
	}
	
	public convenience init() {
		self.init(rootNode: TrieNode(keyValue: nil))
	}
	
	public convenience init(caseSensitive: Bool) {
		self.init(rootNode: TrieNode(keyValue: nil))
		self.caseSensitive = caseSensitive
	}
	
	public func set(_ value: T, forKey lookupKey: String) {
		guard lookupKey.characters.count > 0 else { return }
		
		var currentNode = rootNode
		let caseCorrected = self.caseSensitive ? lookupKey : (lookupKey as NSString).lowercased
		var currentCharacters = Array(caseCorrected.characters)
		
		repeat {
			let currentCharacter = currentCharacters.remove(at: 0)
			
			if let foundNode = currentNode.children.filter({ (node) in node.keyValue == currentCharacter }).first {
				currentNode = foundNode
			} else {
				let node = TrieNode(keyValue: currentCharacter)
				currentNode.children.append(node)
				currentNode = node
			}
		} while currentCharacters.count > 0
		
		currentNode.value = value
	}
	
	public func value(forKey key: String) -> T? {
		guard key.characters.count > 0 else { return nil }
		
		var currentNode = rootNode
		let caseCorrected = self.caseSensitive ? key : (key as NSString).lowercased
		var currentCharacters = Array(caseCorrected.characters)
		
		repeat {
			let currentCharacter = currentCharacters.remove(at: 0)
			
			if let foundNode = currentNode.children.filter({ (node) in node.keyValue == currentCharacter }).first {
				currentNode = foundNode
			} else {
				return nil
			}
		} while currentCharacters.count > 0
		
		return currentNode.value
	}
	
	@discardableResult
	public func remove(valueFor key: String) -> Bool {
		guard key.characters.count > 0 else { return false }
		
		var currentNode = rootNode
		let caseCorrected = self.caseSensitive ? key : (key as NSString).lowercased
		var currentCharacters = Array(caseCorrected.characters)
		
		repeat {
			let currentCharacter = currentCharacters.remove(at: 0)
			
			if let foundNode = currentNode.children.filter({ (node) in node.keyValue == currentCharacter }).first {
				currentNode = foundNode
			} else {
				return false
			}
		} while currentCharacters.count > 0
		
		currentNode.value = nil
		return true
	}
}
