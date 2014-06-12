import XCTest

class LambdaSpecificationTests: XCTestCase {
	
	func testString0() {
		let spec = LambdaSpecification.lambda({ (candidate: String) -> Bool in
			return candidate.hasPrefix("hello");
			});
		XCTAssertTrue(spec.isSatisfiedBy("hello world"))
		XCTAssertTrue(spec.isSatisfiedBy("hello lambda world"))
		XCTAssertFalse(spec.isSatisfiedBy("hell"))
		XCTAssertFalse(spec.isSatisfiedBy(""))
		XCTAssertFalse(spec.isSatisfiedBy("nope"))
	}
	
	func testInt0() {
		let spec = LambdaSpecification.lambda({ (candidate: Int) -> Bool in
			return candidate > 5;
			})
		XCTAssertTrue(spec.isSatisfiedBy(10))
		XCTAssertTrue(spec.isSatisfiedBy(10))
		XCTAssertFalse(spec.isSatisfiedBy(0))
	}
	
}
