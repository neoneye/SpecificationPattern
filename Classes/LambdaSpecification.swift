import Foundation

class LambdaSpecification<T>: CompositeSpecification {
	let lambda: T -> Bool
	
	init(lambda: T -> Bool) {
		self.lambda = lambda
		super.init()
	}
	
	override func isSatisfiedBy(candidate: Any) -> Bool {
		if let obj = candidate as? T {
			return lambda(obj)
		}
		return false
	}
}
