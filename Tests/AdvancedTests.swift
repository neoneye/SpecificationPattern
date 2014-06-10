import XCTest

class AdvancedTests: XCTestCase {
	
	func testAdvanced0() {
		/*
		This specification checks these contraints
		1. the string must be all digits
		2. the string.length must be between 2..4
		3. the string must not contain two zeroes
		*/
		let onlyDigits = CharacterSetSpecification.decimalDigitCharacterSet()
		let between2And4Letters = RegexSpecification.pattern("^.{2,4}$")
		let twoZeroes = RegexSpecification.pattern("0.*0")
		let spec = onlyDigits.and(between2And4Letters).and(twoZeroes.not())
		XCTAssertTrue(spec.isSatisfiedBy("42"))
		XCTAssertTrue(spec.isSatisfiedBy("0123"))
		XCTAssertTrue(spec.isSatisfiedBy("666"))
		XCTAssertFalse(spec.isSatisfiedBy("ice"))
		XCTAssertFalse(spec.isSatisfiedBy("too long"))
		XCTAssertFalse(spec.isSatisfiedBy("00"))
		XCTAssertFalse(spec.isSatisfiedBy("1010"))
	}
	
}
