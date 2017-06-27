//: Playground - noun: a place where people can play

import Cocoa

extension Array where Element: Comparable {
	func insertionSort() -> [Element] {
		var result = self
		
		guard result.count != 1 else { return result }
		
		for i in 1..<result.count {
			var position = i
			let tempValue = result[i]
			
			
			while (position > 0) && (result[position - 1] > tempValue) {
				result[position] = result[position - 1]
				position = position - 1
			}
			
			result[position] = tempValue
		}
		
		return result
	}
}

let numbers = [3,1,9,4,2,6]
let numbers2 = numbers.insertionSort()
