//: Playground - noun: a place where people can play

import Cocoa

extension Array where Element : Comparable {
	mutating func bubbleSort() {
		var unsortedMaxIndex = self.count - 2
		var sorted = false
		
		while sorted == false {
			sorted = true
			var currentIndex = 0
			while currentIndex <= unsortedMaxIndex {
				if self[currentIndex] > self[currentIndex + 1] {
					sorted = false
					self.swapAt(currentIndex, currentIndex + 1)
				}
				currentIndex += 1
			}
			unsortedMaxIndex -= 1
		}
	}
}

let a = [3,2, 9 , 4, 6, 11, 1]
var b = a
b.bubbleSort()
