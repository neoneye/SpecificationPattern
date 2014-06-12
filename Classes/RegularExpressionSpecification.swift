import Foundation

class RegularExpressionSpecification: CompositeSpecification {
	let regularExpression: NSRegularExpression
	
	init(regularExpression: NSRegularExpression) {
		self.regularExpression = regularExpression
		super.init()
	}
	
	class func pattern(pattern: String) -> RegularExpressionSpecification {
		var error: NSError?
		var regularExpression = NSRegularExpression.regularExpressionWithPattern(pattern, options: nil, error: &error)
		assert(!error, "the regular expression pattern must always compile")
		return RegularExpressionSpecification(regularExpression: regularExpression)
	}
	
	override func isSatisfiedBy(candidate: Any) -> Bool {
		if let s = candidate as? String {
			return regularExpression.numberOfMatchesInString(s, options: nil, range: NSMakeRange(0, countElements(s))) > 0
		}
		return false
	}
}
