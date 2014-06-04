//
//  SwiftSpecificationPatternTests.swift
//  SwiftSpecificationPatternTests
//
//  Created by Simon Strandgaard on 04/06/14.
//  Copyright (c) 2014 None. All rights reserved.
//

import XCTest

class SwiftSpecificationPatternTests: XCTestCase {
    
	func testSimple() {
		let spec = RegexSpecification.pattern("^\\d+$")
		XCTAssertTrue(spec.isSatisfiedBy("123"))
		XCTAssertFalse(spec.isSatisfiedBy("abc"))
	}
	
	func testAnd() {
		let spec0 = RegexSpecification.pattern("^hello")
		let spec1 = RegexSpecification.pattern("world$")
		let spec = AndSpecification(spec0, spec1)
		XCTAssertTrue(spec.isSatisfiedBy("hello world"))
		XCTAssertTrue(spec.isSatisfiedBy("hello swift world"))
		XCTAssertFalse(spec.isSatisfiedBy("world hello"))
		XCTAssertFalse(spec.isSatisfiedBy("xyz hello world xzy"))
	}
	
	func testOr() {
		let spec0 = RegexSpecification.pattern("hello")
		let spec1 = RegexSpecification.pattern("world")
		let spec = OrSpecification(spec0, spec1)
		XCTAssertTrue(spec.isSatisfiedBy("hello world"))
		XCTAssertTrue(spec.isSatisfiedBy("hello"))
		XCTAssertTrue(spec.isSatisfiedBy("world"))
		XCTAssertFalse(spec.isSatisfiedBy("johndoe"))
	}
	
	func testNot() {
		let spec0 = RegexSpecification.pattern("hello")
		let spec = NotSpecification(spec0)
		XCTAssertFalse(spec.isSatisfiedBy("hello"))
		XCTAssertTrue(spec.isSatisfiedBy("world"))
	}
	
}
