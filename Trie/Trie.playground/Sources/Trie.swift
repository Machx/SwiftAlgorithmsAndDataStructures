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
