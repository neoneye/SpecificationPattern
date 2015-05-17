import Foundation

class CountSpecification: CompositeSpecification {
	
	class func min(count: Int) -> CountSpecification {
		return CountSpecification().min(count)
	}
	
	class func max(count: Int) -> CountSpecification {
		return CountSpecification().max(count)
	}
	
	class func between(minCount: Int, _ maxCount: Int) -> CountSpecification {
		return CountSpecification().min(minCount).max(maxCount)
	}
	
	class func exactly(count: Int) -> CountSpecification {
		return CountSpecification().min(count).max(count)
	}
	
	var minCount: Int?
	var maxCount: Int?
	
	func min(count: Int) -> CountSpecification {
		minCount = count
		return self
	}
	
	func max(count: Int) -> CountSpecification {
		maxCount = count
		return self
	}
	
	override func isSatisfiedBy(candidate: Any?) -> Bool {
		if candidate == nil {
			return false
		}

		var n: Int = 0
		do {
			if let x = candidate as? String {
				n = count(x)
				break
			}
			
			// Obtain length of Array, see http://stackoverflow.com/a/25901509/78336
			if let y = candidate as? NSArray {
				n = count(y as Array)
				break
			}
			
			// This candidate is not a collection
			return false
		} while(false)
		
		
		switch (minCount, maxCount) {
		case (.Some(let min), .Some(let max)):
			return (n >= min) && (n <= max)
		case (.Some(let min), _):
			return (n >= min)
		case (_, .Some(let max)):
			return (n <= max)
		default:
			break
		}
		
		return false
	}
}
