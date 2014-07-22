import Foundation

class RegularExpressionSpecification: CompositeSpecification {
	let regularExpression: NSRegularExpression
	
	init(regularExpression: NSRegularExpression) {
		self.regularExpression = regularExpression
		super.init()
	}
	
	convenience init(pattern: String) {
		var error: NSError?
		var regularExpression = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error: &error)
		assert(!error, "the regular expression pattern must always compile")
		self.init(regularExpression: regularExpression)
	}
	
	override func isSatisfiedBy(candidate: Any?) -> Bool {
		if let s = candidate as? String {
			return regularExpression.numberOfMatchesInString(s, options: nil, range: NSMakeRange(0, countElements(s))) > 0
		}
		return false
	}
}
