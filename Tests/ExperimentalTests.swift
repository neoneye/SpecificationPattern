import XCTest

class ExperimentalTests: XCTestCase {
	
	func testOperator0() {
		/*
		This specification checks these contraints
		1. the string must be all digits
		2. the string.length must be between 2..4
		3. the string must not contain two zeroes
		*/
		let onlyDigits = CharacterSetSpecification.decimalDigitCharacterSet()
		let between2And4Letters = RegularExpressionSpecification(pattern: "^.{2,4}$")
		let twoZeroes = RegularExpressionSpecification(pattern: "0.*0")
		
		let spec = onlyDigits & between2And4Letters & !twoZeroes
		
		XCTAssertTrue(spec.isSatisfiedBy("42"))
		XCTAssertTrue(spec.isSatisfiedBy("0123"))
		XCTAssertTrue(spec.isSatisfiedBy("666"))
		XCTAssertFalse(spec.isSatisfiedBy("ice"))
		XCTAssertFalse(spec.isSatisfiedBy("too long"))
		XCTAssertFalse(spec.isSatisfiedBy("00"))
		XCTAssertFalse(spec.isSatisfiedBy("1010"))
	}
	
}
