import Foundation

extension Array where Element: Comparable {
	public func binarySearchContains(_ searchValue: Element) -> Bool {
		var upperBound = self.count - 1
		var lowerBound = 0
		
		while lowerBound <= upperBound {
			
			let midpoint = (upperBound + lowerBound) / 2
			let valueAtMidPoint = self[midpoint]
			
			if searchValue < valueAtMidPoint {
				upperBound = midpoint - 1
			} else if searchValue > valueAtMidPoint {
				lowerBound = midpoint + 1
			} else {
				return true
			}
		}
		
		return false
	}
}
