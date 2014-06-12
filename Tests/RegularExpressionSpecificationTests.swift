import XCTest

class RegularExpressionSpecificationTests: XCTestCase {
	
	func testSimple() {
		let spec = RegularExpressionSpecification.pattern("^\\d+$")
		XCTAssertTrue(spec.isSatisfiedBy("123"))
		XCTAssertFalse(spec.isSatisfiedBy("abc"))
	}
	
}