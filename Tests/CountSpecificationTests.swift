import XCTest

class CountSpecificationTests: XCTestCase {
	
	func testStringMin() {
		let spec = CountSpecification.min(3)
		XCTAssertFalse(spec.isSatisfiedBy(nil))
		XCTAssertFalse(spec.isSatisfiedBy(""))
		XCTAssertFalse(spec.isSatisfiedBy("0"))
		XCTAssertFalse(spec.isSatisfiedBy("01"))
		XCTAssertTrue(spec.isSatisfiedBy("012"))
		XCTAssertTrue(spec.isSatisfiedBy("0123"))
	}
	
	func testStringMax() {
		let spec = CountSpecification.max(2)
		XCTAssertTrue(spec.isSatisfiedBy(""))
		XCTAssertTrue(spec.isSatisfiedBy("0"))
		XCTAssertTrue(spec.isSatisfiedBy("01"))
		XCTAssertFalse(spec.isSatisfiedBy("012"))
		XCTAssertFalse(spec.isSatisfiedBy("0123"))
	}
	
	func testStringBetween() {
		let spec = CountSpecification.between(2, 4)
		XCTAssertFalse(spec.isSatisfiedBy(""))
		XCTAssertFalse(spec.isSatisfiedBy("0"))
		XCTAssertTrue(spec.isSatisfiedBy("01"))
		XCTAssertTrue(spec.isSatisfiedBy("012"))
		XCTAssertTrue(spec.isSatisfiedBy("0123"))
		XCTAssertFalse(spec.isSatisfiedBy("01234"))
		XCTAssertFalse(spec.isSatisfiedBy("012345"))
	}

}
