import Foundation

class CharacterSetSpecification: CompositeSpecification {
	let characterSet: NSCharacterSet
	
	init(characterSet: NSCharacterSet) {
		self.characterSet = characterSet
		super.init()
	}
	
	class func controlCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.controlCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}
	
	class func whitespaceCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.whitespaceCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}

	class func whitespaceAndNewlineCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.whitespaceAndNewlineCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}
	
	class func decimalDigitCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.decimalDigitCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}

	class func lowercaseLetterCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.lowercaseLetterCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}
	
	class func uppercaseLetterCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.uppercaseLetterCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}
	
	class func nonBaseCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.nonBaseCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}
	
	class func alphanumericCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.alphanumericCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}
	
	class func decomposableCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.decomposableCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}
	
	class func illegalCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.illegalCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}
	
	class func punctuationCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.punctuationCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}
	
	class func capitalizedLetterCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.capitalizedLetterCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}
	
	class func symbolCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.symbolCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}
	
	class func newlineCharacterSet() -> CharacterSetSpecification {
		let cs = NSCharacterSet.newlineCharacterSet()
		return CharacterSetSpecification(characterSet: cs)
	}

	
	override func isSatisfiedBy(candidate: Any) -> Bool {
		if let fullString = candidate as? String {
			for character: Character in fullString {
				let range: Range<String.Index> =
				String(character).rangeOfCharacterFromSet(characterSet)
				if range.isEmpty {
					return false // one or more characters does not satify the characterSet
				}
			}
			return true // the whole string satisfies our characterSet
		}
		return false
	}
	
}
