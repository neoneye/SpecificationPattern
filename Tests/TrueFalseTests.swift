import XCTest

class TrueFalseTests: XCTestCase {
	
	func testTrue() {
		let spec = TrueSpecification()
		XCTAssertTrue(spec.isSatisfiedBy("hello world"))
		XCTAssertTrue(spec.isSatisfiedBy(nil))
	}
	
	func testFalse() {
		let spec = FalseSpecification()
		XCTAssertFalse(spec.isSatisfiedBy("world hello"))
		XCTAssertFalse(spec.isSatisfiedBy(nil))
	}
	
}
