import XCTest

class RegexSpecificationTests: XCTestCase {
	
	func testSimple() {
		let spec = RegexSpecification.pattern("^\\d+$")
		XCTAssertTrue(spec.isSatisfiedBy("123"))
		XCTAssertFalse(spec.isSatisfiedBy("abc"))
	}
	
}