protocol Specification {
	func isSatisfiedBy(candidate: Any) -> Bool
	func and(other: Specification) -> Specification
	func or(other: Specification) -> Specification
	func not() -> Specification
}

class CompositeSpecification: Specification {
	func isSatisfiedBy(candidate: Any) -> Bool {
		// subclass must implement this method
		return false
	}
	
	func and(other: Specification) -> Specification {
		return AndSpecification(self, other)
	}
	
	func or(other: Specification) -> Specification {
		return OrSpecification(self, other)
	}
	
	func not() -> Specification {
		return NotSpecification(self)
	}
}

class AndSpecification: CompositeSpecification {
	let one: Specification
	let other: Specification
	
	init(_ x: Specification, _ y: Specification)  {
		self.one = x
		self.other = y
		super.init()
	}
	
	override func isSatisfiedBy(candidate: Any) -> Bool {
		return one.isSatisfiedBy(candidate) && other.isSatisfiedBy(candidate)
	}
}

class OrSpecification: CompositeSpecification {
	let one: Specification
	let other: Specification
	
	init(_ x: Specification, _ y: Specification)  {
		self.one = x
		self.other = y
		super.init()
	}
	
	override func isSatisfiedBy(candidate: Any) -> Bool {
		return one.isSatisfiedBy(candidate) || other.isSatisfiedBy(candidate)
	}
}

class NotSpecification: CompositeSpecification {
	let wrapped: Specification
	
	init(_ x: Specification) {
		self.wrapped = x
		super.init()
	}
	
	override func isSatisfiedBy(candidate: Any) -> Bool {
		return !wrapped.isSatisfiedBy(candidate)
	}
}
