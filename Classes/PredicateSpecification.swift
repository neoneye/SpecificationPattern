import Foundation

class PredicateSpecification<T>: CompositeSpecification {
	let predicate: T -> Bool
	
	init(predicate: T -> Bool) {
		self.predicate = predicate
		super.init()
	}
	
	override func isSatisfiedBy(candidate: Any?) -> Bool {
		guard let obj = candidate as? T else { return false }
		return predicate(obj)
	}
}
